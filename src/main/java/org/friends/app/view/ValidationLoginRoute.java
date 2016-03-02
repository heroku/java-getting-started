package org.friends.app.view;

import java.util.HashMap;
import java.util.Map;

import org.friends.app.Constants;
import org.friends.app.model.User;
import org.friends.app.service.impl.UserServiceBean;

import spark.ModelAndView;
import spark.Request;
import spark.Response;

/**
 * Page de Login
 * @author michael lefevre
 */
public class ValidationLoginRoute extends LoginRoute {

	private static final String ERROR = "error";
	private static final String EMAIL = "email";
	
	UserServiceBean userService = new UserServiceBean();

	
	@Override
	public ModelAndView onLogin(Request request, Response response, Map<String, Object> map) throws Exception{
		ModelAndView dest = null;
		String email = request.queryParams("email");
		String pwd = request.queryParams("pwd");
		request.session(true);
		User user = userService.authenticate(email, pwd);
		if (user != null) {
			
			response.cookie(Constants.COOKIE, user.createCookie());
			dest = new SearchRoute().handle(request, response);
			request.session().attribute("placeNumber", null);
			//response.redirect("/protected/search");
			if (user.getPlaceNumber() != null){
				
				request.session().attribute("placeNumber", user.getPlaceNumber().intValue());
				dest = new SharePlace().handle(request, response);
			}
			//response.redirect("/protected/sharePlace");
		}
		
		if(dest == null){
			map.put(ERROR, "Utilisateur introuvable : Email ou mot de passe incorrect !");
			map.put(EMAIL, request.queryParams("email"));
			return new ModelAndView(map, "login.ftl");
		}else{
			return dest;
		}
	}
}
