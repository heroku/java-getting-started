package org.friends.app.model;

import com.google.common.base.Charsets;
import com.google.common.hash.Hashing;

/**
 * A user of the application.
 * @author michael
 */
public class User {
	
	private Integer idUser;
	private String emailAMDM;
	private Integer placeNumber;
	private String pwd;
	
	public User() {}
	
	public User(String email, String mdp) {
		emailAMDM = email;
		pwd = mdp;
	}
	
	/**
	 * @return the idUser
	 */
	public Integer getIdUser() {
		return idUser;
	}
	
	/**
	 * @param idUser the idUser to set
	 */
	public void setIdUser(Integer idUser) {
		this.idUser = idUser;
	}
	
	/**
	 * @return the emailAMDM
	 */
	public String getEmailAMDM() {
		return emailAMDM;
	}
	
	/**
	 * @param emailAMDM the emailAMDM to set
	 */
	public void setEmailAMDM(String emailAMDM) {
		this.emailAMDM = emailAMDM;
	}
	
	/**
	 * @return the placeNumber
	 */
	public Integer getPlaceNumber() {
		return placeNumber;
	}
	
	/**
	 * @param placeNumber the placeNumber to set
	 */
	public void setPlaceNumber(Integer placeNumber) {
		this.placeNumber = placeNumber;
	}
	
	/**
	 * @return the pwd
	 */
	public String getPwd() {
		return pwd;
	}
	
	/**
	 * @param pwd the pwd to set
	 */
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	/**
	 * TODO suffixe avec le date pour que le cookie soit unique pour un user donné
	 * @return
	 */
	public String createCookie() {
		return Hashing.sha1().hashString(emailAMDM, Charsets.UTF_8 ).toString();
	}
}
