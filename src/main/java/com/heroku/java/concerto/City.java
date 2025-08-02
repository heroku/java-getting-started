package com.heroku.java.concerto;
import java.util.UUID;

public class City {
    private UUID id;
    private String image;
    private int imageOffset;
    private String[] locations;
    private String name;
    private String state;

    public UUID getId() {
        return id;
    }

    public City setId(UUID id) {
        this.id = id;
        return this;
    }

    public String getImage() {
        return image;
    }

    public City setImage(String image) {
        this.image = image;
        return this;
    }

    public int getImageOffset() {
        return imageOffset;
    }

    public City setImageOffset(int imageOffset) {
        this.imageOffset = imageOffset;
        return this;
    }

    public String[] getLocations() {
        return locations;
    }

    public City setLocations(String[] locations) {
        this.locations = locations;
        return this;
    }

    public String getName() {
        return name;
    }

    public City setName(String name) {
        this.name = name;
        return this;
    }

    public String getState() {
        return state;
    }

    public City setState(String state) {
        this.state = state;
        return this;
    }
}