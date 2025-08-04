package com.heroku.java.concerto;

import java.util.UUID;

public class EventDTO {
    private UUID id;
    private UUID artistId;
    private Ticket[] tickets;
    private String title;
    private Venue venue;

    public UUID getId() {
        return id;
    }

    public EventDTO setId(UUID id) {
        this.id = id;
        return this;
    }

    public UUID getArtistId() {
        return artistId;
    }

    public EventDTO setArtistId(UUID artistId) {
        this.artistId = artistId;
        return this;
    }

    public Ticket[] getTickets() {
        return tickets;
    }

    public EventDTO setTickets(Ticket[] tickets) {
        this.tickets = tickets;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public EventDTO setTitle(String title) {
        this.title = title;
        return this;
    }

    public Venue getVenue() {
        return venue;
    }
    
    public EventDTO setVenue(Venue venue) {
        this.venue = venue;
        return this;
    }
}
