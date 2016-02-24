package org.friends.app.service.impl;

import org.friends.app.dao.UserDao;
import org.friends.app.model.User;

import com.google.common.base.Strings;

import spark.utils.Assert;

public class UserServiceBean {
	
	UserDao userDao = new UserDao();
	
	public User findUserByEmail(String email) {
		if (Strings.isNullOrEmpty(email))
			return null;
		return userDao.findFirst(user -> user.getEmail().equals(email));
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
		userDao.persist(user);
	}
	
	public void update(User user) {}
	public void delete(User user) {}
	public void reset(User user) {}
	public User findUserByCookie(String cookie) {
		throw new UnsupportedOperationException("TODO");
	}
}
