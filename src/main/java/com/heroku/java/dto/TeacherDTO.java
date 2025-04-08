package com.heroku.java.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TeacherDTO {
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String introduction;
    private String additionalInfo;
}