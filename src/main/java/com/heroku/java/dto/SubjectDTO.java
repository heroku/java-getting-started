package com.heroku.java.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.heroku.java.models.Teacher;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SubjectDTO implements Serializable {
    @Id
    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
    private Long id;

    @NotNull
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String name;

    @NotNull
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String description;

    @NotNull
    @JsonFormat(shape = JsonFormat.Shape.ARRAY)
    private List<Teacher> teachers;
}