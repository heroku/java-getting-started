package org.friends.app.model;

/**
 * A user of the application.
 * @author michael
 */
public class User {
	
	private Integer idUser;
	private String emailAMDM;
	private Integer placeNumber;
	private String pwd;
	
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
	
	
}
