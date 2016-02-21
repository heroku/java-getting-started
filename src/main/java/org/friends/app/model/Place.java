package org.friends.app.model;

public class Place {
	private boolean free;
	private int number;

	public Place(int n, boolean f) {
		number = n;
		free = f;
	}
	
	public int getNumber() {
		return number;
	}
	
	public boolean isFree() {
		return free;
	}
}
