package org.friends.app.service;

import org.friends.app.model.User;

public class UserBuilder {
	public static UserBuilder unUser() {
		return new UserBuilder();
	}

	public User build() {
		return new User();
	}
}
