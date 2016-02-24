package org.friends.app.service;

import java.io.InvalidObjectException;

import org.friends.app.model.User;
import org.friends.app.service.impl.UserServiceBean;
import org.junit.Test;


public class UserService_Create_Test {
	
	UserServiceBean service = new UserServiceBean();
	
	@Test(expected=IllegalArgumentException.class)
	public void un_user_ne_doit_pas_etre_null() {
		service.create(null);
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void un_user_doit_avoir_un_mot_de_passe() {
		User user = UserBuilder.unUser().build();
		service.create(user);
	}
}
