package org.friends.app.view;

import java.util.HashMap;
import java.util.Map;

import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.TemplateViewRoute;

/**
 * Page de Login
 * @author michael lefevre
 */
public class LoginRoute implements TemplateViewRoute {

	private static final String ERROR = "error";
	private static final String EMAIL = "email";
	private String errorMessage;
	private String email;
	
	@Override
	public ModelAndView handle(Request request, Response response) throws Exception {
		
		onLogin(request, response);
		
    	return new ModelAndView(buildMap(), "login.ftl");
	}

	private Object buildMap() {
		Map<String, Object> map = new HashMap<>();
		map.put(ERROR, errorMessage != null ? errorMessage : "");
		map.put(EMAIL, email != null ? email : "");
		return map;
	}

	protected void setErrorMessage(String message) {
		errorMessage = message;
	}
	
	protected void setEmail(String mail) {
		email = mail;
	}

	protected void onLogin(Request request, Response response) throws Exception{
	}
}
