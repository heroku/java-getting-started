package org.friends.app.view;

import java.util.HashMap;
import java.util.Map;

import org.friends.app.service.impl.UserServiceBean;

import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.TemplateViewRoute;

/**
 * Page de Login
 * @author michael lefevre
 */
public class LoginRoute implements TemplateViewRoute {
	
	UserServiceBean userService = new UserServiceBean();
	
	@Override
	public ModelAndView handle(Request request, Response response) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		return onLogin(request, response, map);

	}
	
	public ModelAndView onLogin(Request request, Response response, Map<String, Object> map) throws Exception{
		return new ModelAndView(map, "login.ftl");
	}
}
