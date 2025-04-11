package com.heroku.java.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.sql.Timestamp;

@Getter
@Setter
@AllArgsConstructor
public class ContactForm implements Serializable {
    @NotEmpty
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String name;

    @NotEmpty
    @Email
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String email;

    @NotEmpty
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String phone;

    @NotEmpty
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String subject;

    @NotEmpty
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String message;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
    private final Long timestamp = Timestamp.valueOf("2020-01-01 00:00:00").getTime();
}
