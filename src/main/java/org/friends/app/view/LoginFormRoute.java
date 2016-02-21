package org.friends.app.view;

import java.util.HashMap;
import java.util.Map;

import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.TemplateViewRoute;

public class LoginFormRoute implements TemplateViewRoute {

	@Override
	public ModelAndView handle(Request request, Response response) throws Exception {
		Map<String, Object> map = new HashMap<>();
        return new ModelAndView(map, "login.ftl");
	}

}
