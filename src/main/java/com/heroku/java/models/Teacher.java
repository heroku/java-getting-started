package com.heroku.java.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;

import java.io.Serializable;
import java.util.List;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "teachers",
        indexes = {
                @Index(name = "idx_first_name_3", columnList = "firstName"),
                @Index(name = "idx_last_name_3", columnList = "lastName"),
        })
public class Teacher implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String firstName;

    @NotNull
    private String lastName;

    @Email
    private String email;

    @Pattern(regexp = "^(\\(\\d{3}\\)-\\d{3}-\\d{4}|\\+?[0-9]{10,13})$")
    private String phone;

    @AssertTrue
    private boolean isActive = true;

    @NotEmpty
    @JoinTable(
            name = "teacher_subject",
            joinColumns = @JoinColumn(name = "teacher_id"),
            inverseJoinColumns = @JoinColumn(name = "subject_id")
    )
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Subject> subjects;
}