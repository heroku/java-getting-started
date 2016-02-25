package org.friends.app.view;

import java.util.UUID;

import org.friends.app.Constants;
import org.friends.app.model.User;
import org.friends.app.service.impl.UserServiceBean;

import spark.Request;
import spark.Response;

/**
 * Extension de la page login pour la gestion des erreurs en cas d'erreur de signature
 * @author michael lefevre
 */
public class ValidLoginRoute extends LoginRoute {

	UserServiceBean userService = new UserServiceBean();
	
	@Override
	protected void onLogin(Request request, Response response) throws Exception {
		String email = request.queryParams("email");
		String pwd = request.queryParams("pwd");
		
		User user = userService.Authenticate(email, pwd);
		if (user != null) {
			response.cookie(Constants.COOKIE, UUID.randomUUID().toString());

			String dest = "/protected/search";
			if (user.getPlaceNumber() != null)
				dest = "/protected/sharePlace";
			response.redirect(dest);
		} else {
			setErrorMessage("Email ou mot de passe incorrect");
			setEmail(email);
		}
	}
}
