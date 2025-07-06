package com.heroku.java;

import com.heroku.java.Status;
import java.util.UUID;
import java.util.Date;

public class Task {
    private UUID id;
    private String title;
    private String description;
    private Date dueDate;
    private UUID assignee;
    private int storyPoints;
    private Status status;
    private double rank;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public UUID getAssignee() {
        return assignee;
    }

    public void setAssignee(UUID assignee) {
        this.assignee = assignee;
    }

    public int getStoryPoints() {
        return storyPoints;
    }

    public void setStoryPoints(int storyPoints) {
        this.storyPoints = storyPoints;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public double getRank() {
        return rank;
    }

    public void setRank(double rank) {
        this.rank = rank;
    }
}