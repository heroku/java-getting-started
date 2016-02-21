package org.friends.app.view;

import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.staticFileLocation;

import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.heroku.sdk.jdbc.DatabaseUrl;

import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

public class Application {
	
	public final static String PORT = "PORT";
	
	public void start(String [] args) {
		port(getPort());
	    staticFileLocation("/public");

	    get("/help", (req, res) -> "Nothing yet at help");
	    get("/share", (req, res) -> "Nothing yet at share");    

	    get("/login", new LoginFormRoute(), new FreeMarkerEngine());
	    get("/login/process", (req, res) -> "Nothing yet at share");
	    
	    get("/search", new SearchRoute(), new FreeMarkerEngine());
	    
	    get("/", (request, response) -> {
	            return new ModelAndView(null, "index.ftl");
	        }, new FreeMarkerEngine());

	    get("/db", (req, res) -> {
	      Connection connection = null;
	      Map<String, Object> attributes = new HashMap<>();
	      try {
	        connection = getConnection();

	        Statement stmt = connection.createStatement();
	        stmt.executeUpdate("CREATE TABLE IF NOT EXISTS ticks (tick timestamp)");
	        stmt.executeUpdate("INSERT INTO ticks VALUES (now())");
	        ResultSet rs = stmt.executeQuery("SELECT tick FROM ticks");

	        ArrayList<String> output = new ArrayList<String>();
	        while (rs.next()) {
	          output.add( "Read from DB: " + rs.getTimestamp("tick"));
	        }

	        attributes.put("results", output);
	        return new ModelAndView(attributes, "db.ftl");
	      } catch (Exception e) {
	        attributes.put("message", "There was an error: " + e);
	        return new ModelAndView(attributes, "error.ftl");
	      } finally {
	        if (connection != null) try{connection.close();} catch(SQLException e){}
	      }
	    }, new FreeMarkerEngine());
	}

	protected Connection getConnection() throws SQLException, URISyntaxException {
		return DatabaseUrl.extract().getConnection();
	}

	private Integer getPort() {
		String port = System.getenv(PORT);
		if (port == null)
			port = System.getProperty(PORT);
		if (port == null)
			throw new RuntimeException("Port not defined");
		return Integer.valueOf(port);
	}
}
