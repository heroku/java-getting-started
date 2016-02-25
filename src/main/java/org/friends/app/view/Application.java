package org.friends.app.view;

import static org.friends.app.Configuration.getPort;
import static spark.Spark.get;
import static spark.Spark.port;
import static spark.Spark.post;
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
	
	private static Application instance;

	public Application() {
		if (instance == null) instance = this;
	}
	
	public void start() {
		port(getPort());
	    staticFileLocation("/public");

	    get("/", (request, response) -> {
	    	return new ModelAndView(null, "index.ftl");
	    }, new FreeMarkerEngine());

	    
	    /* User managment */
	    get("/user/login", (req, res) -> {
	    	return new ModelAndView(null, "login.ftl");
	    }, new FreeMarkerEngine());
	    post("/user/login", (req, res) -> "A user tried to login");
	    
	    get("/user/new", (req, res) -> {
	    	return new ModelAndView(null, "createUser.ftl");
	    }, new FreeMarkerEngine());
	    post("/user/new", (req, res) -> "A user tried to create his account");
	    
	    
	    get("/user/forget", (req, res) -> {
	    	return new ModelAndView(null, "lostPwd.ftl");
	    }, new FreeMarkerEngine());
	    post("/user/forget", (req, res) -> "A user lost his password");
	    
	    
	    /* places booking */
	    get("/book/:placeId", (req, res) -> {
	        return "Are you looking for " + req.params(":placeId");
	    });

	    get("/sharePlace", new SharePlace(), new FreeMarkerEngine()); 
	    post("/sharePlace",(req, res) -> "Vous liberez la place   " + req.queryParams("number") +" du " + req.queryParams("dateDebut") +" du " + req.queryParams("dateFin"));
	    


	    
	    
	    
	    get("/search", new SearchRoute(), new FreeMarkerEngine());
	    
	    get("/help", (req, res) -> "Nothing yet at help");

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
	
	public static Application instance() {
		return instance;
	}
}
