package com.heroku.java.dto;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.heroku.java.models.Subject;
import jakarta.persistence.Id;
import lombok.*;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TeacherDTO implements Serializable {
    @Id
    @JsonFormat(shape = JsonFormat.Shape.NUMBER_INT)
    private Long id;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String firstName;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String lastName;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String email;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private String phone;

    @JsonFormat(shape = JsonFormat.Shape.ARRAY)
    private List<Subject> subjects;
}
