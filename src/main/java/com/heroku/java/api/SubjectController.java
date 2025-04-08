package com.heroku.java.api;

import com.heroku.java.services.SubjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class SubjectController {
    private final SubjectService subjectService;

    @GetMapping("/api/subjects")
    public ResponseEntity<Iterable<com.heroku.java.models.Subject>> getAllSubjects() {
        return new ResponseEntity<>(subjectService.findAllSubjects(), HttpStatus.OK);
    }
}
