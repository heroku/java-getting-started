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
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.friends.app.model.Place;
import org.friends.app.service.impl.PlaceServiceBean;

import com.heroku.sdk.jdbc.DatabaseUrl;

import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

public class Application {
	
	public final static String PORT = "PORT";
	
	private PlaceServiceBean placeService = new PlaceServiceBean();
	
	public void start(String [] args) {
		port(getPort());
	    staticFileLocation("/public");

	    get("/help", (req, res) -> "Nothing yet at help");
	    get("/share", (req, res) -> "Nothing yet at share");    
	    get("/login", (req, res) -> "Nothing yet at login");
	    
	    get("/search", (req, res) -> {
	    	Map<String, Object> map = new HashMap<>();
	    	map.put("places", getPlaces());
            return new ModelAndView(map, "search.ftl");
        }, new FreeMarkerEngine());
	    
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

	private List<Place> getPlaces() {
		List<Place> places = new ArrayList<>();
		List<Integer> freePlaces = placeService.getShared();
		for (int i = 1; i<150; i++) {
			places.add(new Place(i, freePlaces.contains(i)));
		}
		return places;
	}

	private HashMap<Integer, Integer> toMap(List<Integer> shared) {
		HashMap<Integer, Integer> back = new HashMap<>();
		shared.stream().forEach(i -> back.put(i, i));
		return back;
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
