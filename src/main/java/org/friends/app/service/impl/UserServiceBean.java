package org.friends.app.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.friends.app.model.User;

import com.google.common.base.Strings;

public class UserServiceBean {

	private static List<User> userCache = new ArrayList<>();
	
	public User findUserByEmail(String email) {
		if (Strings.isNullOrEmpty(email))
			return null;
		
		Optional<User> user = userCache.stream().filter(u -> u.getEmail().equalsIgnoreCase(email)).findFirst();
		return user.isPresent() ? user.get() : null;
	}
	
	public void create(User user) {}
	public void update(User user) {}
	public void delete(User user) {}
	public void reset(User user) {}
	public User findUserByCookie(String cookie) {
		throw new UnsupportedOperationException("TODO");
	}
}
