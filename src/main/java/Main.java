import static spark.Spark.get;
import static spark.SparkBase.port;
import static spark.SparkBase.staticFileLocation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import spark.ModelAndView;
import spark.Route;
import spark.Spark;
import spark.template.freemarker.FreeMarkerEngine;

import com.heroku.sdk.jdbc.DatabaseUrl;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;

public class Main {

	public static void main(String[] args) throws UnirestException {

		port(Integer.valueOf(System.getenv("PORT")));
		staticFileLocation("/public");

		get("/hello", getCard());

		// TODO route
		Spark.post("/player/1/disturb", null);
		// TODO route
		Spark.post("/player/2/disturb", null);

		get("/player/1/bet", (req, res) -> "Player 1 bet");
		get("/player/2/bet", (req, res) -> "Player 2 bet");

		get("/player/1/play", (req, res) -> "Player 1 Play");
		get("/player/2/play", (req, res) -> "Player 2 Play");

		get("/", (request, response) -> {
			Map<String, Object> attributes = new HashMap<>();
			attributes.put("message", "Hello World!");

			return new ModelAndView(attributes, "index.ftl");
		}, new FreeMarkerEngine());

		get("/db",
				(req, res) -> {
					Connection connection = null;
					Map<String, Object> attributes = new HashMap<>();
					try {
						connection = DatabaseUrl.extract().getConnection();

						Statement stmt = connection.createStatement();
						stmt.executeUpdate("CREATE TABLE IF NOT EXISTS ticks (tick timestamp)");
						stmt.executeUpdate("INSERT INTO ticks VALUES (now())");
						ResultSet rs = stmt
								.executeQuery("SELECT tick FROM ticks");

						ArrayList<String> output = new ArrayList<String>();
						while (rs.next()) {
							output.add("Read from DB: "
									+ rs.getTimestamp("tick"));
						}

						attributes.put("results", output);
						return new ModelAndView(attributes, "db.ftl");
					} catch (Exception e) {
						attributes.put("message", "There was an error: " + e);
						return new ModelAndView(attributes, "error.ftl");
					} finally {
						if (connection != null)
							try {
								connection.close();
							} catch (SQLException e) {
							}
					}
				}, new FreeMarkerEngine());

	}

	protected static Route getCard() throws UnirestException {
		// 5 times
		HttpResponse<JsonNode> card = Unirest.get(
				"http://socratesdealer.herokuapp.com/getCard").asJson();
		System.out.println(card.toString());

		// get(, );

		return (req, res) -> card.toString();
	}

}
