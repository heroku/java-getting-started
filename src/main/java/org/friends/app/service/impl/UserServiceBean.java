package org.friends.app.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.friends.app.model.User;

import com.google.common.base.Strings;

import spark.utils.Assert;

public class UserServiceBean {

	private static List<User> userCache = new ArrayList<>();
	
	public User findUserByEmail(String email) {
		if (Strings.isNullOrEmpty(email))
			return null;
		
		Optional<User> user = userCache.stream().filter(u -> u.getEmail().equalsIgnoreCase(email)).findFirst();
		return user.isPresent() ? user.get() : null;
	}
	
	/**
	 * Création d'un utilisateur.
	 * Voici les règles a respecter lors de la création :
	 * <ul>
	 *   <li>Un utilisateur doit comporter un email</li>
	 *   <li>Aucun utilisateur ne comporte le même email</li>
	 * </ul>
	 * @param user
	 */
	public void create(User user) {
		Assert.notNull(user);
		Assert.notNull(user.getEmail());
	}
	
	public void update(User user) {}
	public void delete(User user) {}
	public void reset(User user) {}
	public User findUserByCookie(String cookie) {
		throw new UnsupportedOperationException("TODO");
	}
}
