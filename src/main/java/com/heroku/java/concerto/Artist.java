package com.heroku.java.concerto;
import java.util.UUID;

public class Artist {
    private UUID id;
    private String name;
    private String genre;
    private String image;
    private int imageOffset;
    private String description;
    private String tour;

    public UUID getId() {
        return id;
    }

    public Artist setId(UUID id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Artist setName(String name) {
        this.name = name;
        return this;
    }

     public String getGenre() {
        return genre;
    }

    public Artist setGenre(String genre) {
        this.genre = genre;
        return this;
    }

    public String getImage() {
        return image;
    }

    public Artist setImage(String image) {
        this.image = image;
        return this;
    }

    public int getImageOffset() {
        return imageOffset;
    }

    public Artist setImageOffset(int imageOffset) {
        this.imageOffset = imageOffset;
        return this;
    }

    public String getDescription() {
        return description;
    }

    public Artist setDescription(String description) {
        this.description = description;
        return this;
    }

    public String getTour() {
        return tour;
    }

    public Artist setTour(String tour) {
        this.tour = tour;
        return this;
    }
}