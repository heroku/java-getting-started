package com.heroku.java.dto;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.heroku.java.models.Subject;
import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.hibernate.validator.constraints.URL;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TestimonialDTO implements Serializable {
//    @Id
//    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
//    private Long id;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String testimonial;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String firstName;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String lastName;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String imageUrl;

    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
    private Integer rating;

    @JsonFormat(shape = JsonFormat.Shape.OBJECT)
    private Subject subject;

    @JsonFormat(shape = JsonFormat.Shape.OBJECT)
    private Date date;
}
