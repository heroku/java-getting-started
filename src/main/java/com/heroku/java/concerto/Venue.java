package com.heroku.java.concerto;

import java.util.Date;
import java.util.UUID;

public class Venue {
    private UUID id;
    private UUID cityId;
    private String location;
    private Date timeStamp;

    public UUID getId() {
        return id;
    }

    public Venue setId(UUID id) {
        this.id = id;
        return this;
    }

    public UUID getCityId() {
        return cityId;
    }

    public Venue setCityId(UUID cityId) {
        this.cityId = cityId;
        return this;
    }

    public String getLocation() {
        return location;
    }

    public Venue setLocation(String location) {
        this.location = location;
        return this;
    }

    public Date getTimeStamp() {
        return timeStamp;
    }
    
    public Venue setTimeStamp(Date timeStamp) {
        this.timeStamp = timeStamp;
        return this;
    }
}
