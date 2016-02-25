package org.friends.app.service.impl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.friends.app.dao.UserDao;
import org.friends.app.model.User;

import com.google.common.base.Strings;

import spark.utils.Assert;

public class UserServiceBean {
	
	UserDao userDao = new UserDao();
	
	/**
	 * Authentification de l'utilisateur
	 * 
	 * @param email email AMDM
	 * @param pwd mot de passe
	 * @return
	 * @throws Exception
	 */
	public User Authenticate (String email, String pwd) throws Exception{
		if (Strings.isNullOrEmpty(email) || Strings.isNullOrEmpty(pwd))
			return null;
		
		// Email validator
		if (!emailAMDMValidate(email))
			throw new Exception("L'email saisi est incorrect !");
		
		User user = findUserByEmail(email);
		if (user == null)
			throw new Exception("Utilisateur introuvable !");
		
		if (!pwd.equals(user.getPwd()))
			throw new Exception("Mot de passe incorrect !");
		
		return user;
	}
	
	public User findUserByEmail(String email) {
		return userDao.findFirst(user -> user.getEmailAMDM().equals(email));
	}
	
	/**
	 * Création d'un utilisateur.
	 * Voici les règles a respecter lors de la création :
	 * <ul>
	 *   <li>Un utilisateur doit comporter un email</li>
	 *   <li>Un utilisateur doit avoir un mot de passe</li>
	 *   <li>Aucun utilisateur ne comporte le même email</li>
	 * </ul>
	 * @param user
	 * @throws Exception 
	 */
	public void create(User user) throws Exception {
		Assert.notNull(user);
		Assert.notNull(user.getEmailAMDM());
		Assert.notNull(user.getPwd());
		
		// Email validator
		if (!emailAMDMValidate(user.getEmailAMDM()))
			throw new Exception("L'email saisi est incorrect !");
		
		userDao.persist(user);
	}
	
	public void update(User user) {}
	public void delete(User user) {}
	public void reset(User user) {}
	public User findUserByCookie(String cookie) {
		throw new UnsupportedOperationException("TODO");
	}
	
	
	/**
	 * On valide le format de l'email saisi qui doit être celui de l'AMDM
	 * 
	 * @param email
	 * @return
	 */
	public static boolean emailAMDMValidate(final String email){
		
	    Pattern pattern;
	    Matcher matcher;
	    String EMAIL_PATTERN = "^[A-Za-z]+\\.([A-Za-z]+)*@amdm.fr";
	    pattern = Pattern.compile(EMAIL_PATTERN);
	    
	    matcher = pattern.matcher(email);
        return matcher.matches();
		
	}	
	
}
