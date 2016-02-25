package org.friends.app.service;

import org.friends.app.model.User;
import org.friends.app.service.impl.UserServiceBean;
import org.junit.Test;


public class UserService_Create_Test {
	
	UserServiceBean service = new UserServiceBean();
	
	@Test(expected=IllegalArgumentException.class)
	public void un_user_ne_doit_pas_etre_null() throws Exception {
		service.create(null);
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void un_user_doit_avoir_un_mot_de_passe() throws Exception {
		User user = UserBuilder.unUser().build();
		service.create(user);
	}
}
