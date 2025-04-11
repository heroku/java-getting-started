package com.heroku.java.api;

import com.heroku.java.dto.TeacherDTO;
import com.heroku.java.services.TeacherService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class TeacherController {
    private final TeacherService teacherService;

    @GetMapping("/teachers")
    public ResponseEntity<Iterable<TeacherDTO>> getTeachers(){
        return new ResponseEntity<>(teacherService.findAllTeacherDTOs(), HttpStatus.OK);
    }
}
