package org.friends.app.service;

import org.friends.app.model.User;
import org.friends.app.service.impl.UserServiceBean;
import org.junit.Test;


public class UserService_Create_Test {
	
	UserServiceBean service = new UserServiceBean();
	
	/*
	 * Test avec user null
	 */
	@Test(expected=IllegalArgumentException.class)
	public void un_user_ne_doit_pas_etre_null() throws Exception {
		service.create(null);
	}
	
	/*
	 * Test avec email null
	 */
	@Test(expected=IllegalArgumentException.class)
	public void un_user_doit_avoir_un_email() throws Exception {
		User user = UserBuilder.unUser().build(null, "mdp");
		service.create(user);
	}	
	
	/*
	 * Test avec mot de passe null
	 */
	@Test(expected=IllegalArgumentException.class)
	public void un_user_doit_avoir_un_mot_de_passe() throws Exception {
		User user = UserBuilder.unUser().build("email@gmail.com", null);
		service.create(user);
	}

	/*
	 * Test email AMDM sans '.' 
	 */
	@Test(expected=Exception.class)
	public void un_user_doit_avoir_un_email_avec_point() throws Exception {
		User user = UserBuilder.unUser().build("nom@amdm.fr", "mdp");
		service.create(user);		
	}
	
	
	@Test(expected=Exception.class)
	public void un_user_doit_avoir_un_email_avec_deux_points() throws Exception {
		User user = UserBuilder.unUser().build("prenom.nom.test@amdm.fr", "mdp");
		service.create(user);		
	}	
	
	/*
	 * Test email ne terminant pas par '@amdm.fr'
	 */
	@Test(expected=Exception.class)
	public void un_user_doit_avoir_un_email_amdm() throws Exception {
		User user = UserBuilder.unUser().build("prenom.nom@gmail.com", "mdp");
		service.create(user);
	}	
	
	/*
	 * Test email contenant un chiffre
	 */
	@Test(expected=Exception.class)
	public void un_user_doit_avoir_un_email_valide() throws Exception {
		User user = UserBuilder.unUser().build("prenom.1nom@amdm.fr", "mdp");
		service.create(user);
	}	
	
	/*
	 * Test de validation de données
	 */
	@Test()
	public void un_user_doit_avoir_un_email_valide_et_un_mdp() throws Exception {
		User user = UserBuilder.unUser().build("prenom.nom@amdm.fr", "mdp");
		service.create(user);
	}	
}
