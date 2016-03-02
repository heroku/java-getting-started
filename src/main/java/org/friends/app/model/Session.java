package org.friends.app.model;

/**
 * Fait la jointure entre un user et une session sur un device
 * 
 * @author michael
 */
public class Session {
	Integer userId;
	String cookie;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getCookie() {
		return cookie;
	}

	public void setCookie(String cookie) {
		this.cookie = cookie;
	}
	@Override
	public String toString() {
		return String.format("[Session : userId=%d, cookie=%s]", userId, cookie);
	}
}
