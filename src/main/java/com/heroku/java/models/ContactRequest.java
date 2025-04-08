package com.heroku.java.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "contact_requests")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContactRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String message;

    @ManyToOne
    @JoinColumn(name = "subject_id")
    private Subject subject;

    private boolean isRead = false;
}