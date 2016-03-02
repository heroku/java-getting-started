package org.friends.app.model;

import java.util.Date;

public class Place {
	
	private Integer placeNumber;
	private Integer occupiedBy;
	private Date occupationDate;
	private boolean free;
	
	public Place(int n, boolean f) {
		placeNumber = n;
		free = f;
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
	 * @return the occupiedBy
	 */
	public Integer getOccupiedBy() {
		return occupiedBy;
	}
	
	/**
	 * @param occupiedBy the occupiedBy to set
	 */
	public void setOccupiedBy(Integer occupiedBy) {
		this.occupiedBy = occupiedBy;
	}
	
	/**
	 * @return the occupationDate
	 */
	public Date getOccupationDate() {
		return occupationDate;
	}
	
	/**
	 * @param occupationDate the occupationDate to set
	 */
	public void setOccupationDate(Date occupationDate) {
		this.occupationDate = occupationDate;
	}

	public boolean isFree() {
		return free;
	}
	
}
