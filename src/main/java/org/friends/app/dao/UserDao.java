package org.friends.app.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.function.Predicate;

import org.friends.app.model.User;

import spark.utils.Assert;

public class UserDao {

	private static List<User> userCache = new ArrayList<>();
    
    static{
    	User abdel = new User("abdel.tamditi@amdm.fr","at");
    	userCache.add(abdel);
    	User william = new User("william.verdeil@amdm.fr","wv");
    	william.setPlaceNumber(Integer.valueOf(141));
    	userCache.add(william);
    	User mick = new User("michael.lefevre@amdm.fr","ml");
    	mick.setPlaceNumber(Integer.valueOf(87));
    	userCache.add(mick);
    }		
	
	public User persist(User user) {
		Assert.notNull(user);
		userCache.add(user);
		return user;
	}

	public User findFirst(Predicate<User> predicate) {
		Optional<User> user = userCache.stream().filter(predicate).findFirst();
		return user.isPresent() ? user.get() : null;
	}
}
