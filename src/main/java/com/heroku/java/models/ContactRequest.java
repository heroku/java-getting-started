package com.heroku.java.models;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "contact_requests", indexes = @Index(name = "idx_is_read", columnList = "isRead"))
public class ContactRequest implements Serializable {

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