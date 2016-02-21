package org.friends.app.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.friends.app.model.Place;
import org.friends.app.service.impl.PlaceServiceBean;

import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.TemplateViewRoute;

public class SearchRoute implements TemplateViewRoute {

	private PlaceServiceBean placeService = new PlaceServiceBean();
	
	@Override
	public ModelAndView handle(Request req, Response resp) throws Exception {
    	Map<String, Object> map = new HashMap<>();
    	map.put("places", getPlaces());
        return new ModelAndView(map, "search.ftl");
	}

	private List<Place> getPlaces() {
		List<Place> places = new ArrayList<>();
		List<Integer> freePlaces = placeService.getShared();
		for (int i = 1; i<150; i++) {
			places.add(new Place(i, freePlaces.contains(i)));
		}
		return places;
	}
}
