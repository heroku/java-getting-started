package org.friends.app.view;

import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.TemplateViewRoute;

public class SharePlace implements TemplateViewRoute {

	@Override
	public ModelAndView handle(Request paramRequest, Response paramResponse)
			throws Exception {
		return new ModelAndView(null, "sharePlace.ftl");
	}
	
}
