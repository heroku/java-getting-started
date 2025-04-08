package com.heroku.java.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class ContactForm {
    @NotEmpty
    private final String name;
    @NotEmpty
    @Email
    private final String email;
    @NotEmpty
    private final String phone;
    @NotEmpty
    private final String subject;
    @NotEmpty
    private final String message;

    private final long timestamp = getTimestamp();
}
