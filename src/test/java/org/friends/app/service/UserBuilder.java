package org.friends.app.service;

import org.friends.app.model.User;

public class UserBuilder {

	public static UserBuilder unUser() {
		return new UserBuilder();
	}

	public User build() {
		return new User();
	}
	
	public User build(String email, String pwd) {
		return new User(email, pwd);
	}
	
}
