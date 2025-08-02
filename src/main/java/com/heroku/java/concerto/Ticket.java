package com.heroku.java.concerto;

import java.util.UUID;

public class Ticket {
    private UUID id;
    private int amountAvailable;
    private double price;
    private String seatGroup;

    public UUID getId() {
        return id;
    }

    public Ticket setId(UUID id) {
        this.id = id;
        return this;
    }

    public int getAmountAvailable() {
        return amountAvailable;
    }

    public Ticket setAmountAvailable(int amountAvailable) {
        this.amountAvailable = amountAvailable;
        return this;
    }

    public double getPrice() {
        return price;
    }

    public Ticket setPrice(double price) {
        this.price = price;
        return this;
    }

    public String getSeatGroup() {
        return seatGroup;
    }

    public Ticket setSeatGroup(String seatGroup) {
        this.seatGroup = seatGroup;
        return this;
    }    
}
