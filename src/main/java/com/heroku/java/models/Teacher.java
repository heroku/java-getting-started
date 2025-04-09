package com.heroku.java.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "teachers")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Teacher {
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