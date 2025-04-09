package com.heroku.java.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "subjects")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Subject {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String name;

    @NotNull
    private String description;

    @AssertTrue
    private boolean isActive = true;

    @NotEmpty
    @ManyToMany(
            mappedBy = "subjects",
            fetch = FetchType.EAGER,
            cascade = CascadeType.MERGE)
    private List<Teacher> teachers;
}