package com.heroku.java.concerto;

import java.util.UUID;

public class Event {
    private UUID id;
    private UUID artistId;
    private UUID[] ticketIds;
    private String title;
    private UUID venueId;

    public UUID getId() {
        return id;
    }

    public Event setId(UUID id) {
        this.id = id;
        return this;
    }

    public UUID getArtistId() {
        return artistId;
    }

    public Event setArtistId(UUID artistId) {
        this.artistId = artistId;
        return this;
    }

    public UUID[] getTicketIds() {
        return ticketIds;
    }

    public Event setTicketIds(UUID[] ticketIds) {
        this.ticketIds = ticketIds;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public Event setTitle(String title) {
        this.title = title;
        return this;
    }

    public UUID getVenueId() {
        return venueId;
    }

    public Event setVenueId(UUID venueId) {
        this.venueId = venueId;
        return this;
    }
}
