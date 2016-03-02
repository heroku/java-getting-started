package org.friends.app.view;

import org.friends.app.model.Place;

import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.TemplateViewRoute;

public class SharePlace implements TemplateViewRoute {

	@Override
	public ModelAndView handle(Request paramRequest, Response paramResponse)
			throws Exception {
		Place place = new Place(paramRequest.session().attribute("placeNumber"), true);
		
		ModelAndView model = new ModelAndView(place, "sharePlace.ftl");
		return model;
	}
	
}
