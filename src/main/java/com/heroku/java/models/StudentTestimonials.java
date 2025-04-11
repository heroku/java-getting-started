package com.heroku.java.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;
import org.hibernate.validator.constraints.URL;

import java.io.Serializable;
import java.util.Date;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "student_testimonials", indexes = {
        @Index(name = "idx_subject_id_2", columnList = "subject_id"),
        @Index(name = "idx_date", columnList = "date")
})
public class StudentTestimonials implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String testimonial;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @NotNull
    private Boolean isValid;

    @URL
    private String imageUrl;

    @Min(0)
    @Max(5)
    private Integer rating;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "subject_id", nullable = false)
    private Subject subject;

    @Temporal(TemporalType.DATE)
    private Date date;
}
