package com.heroku.java.api;

import com.heroku.java.dto.SubjectDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class SubjectController {

    @GetMapping("/api/subjects")
    public ResponseEntity<Iterable<SubjectDTO>> getAllSubjects() {
        return new ResponseEntity<>(cacheService.getAllSubjects(), HttpStatus.OK);
    }
}
