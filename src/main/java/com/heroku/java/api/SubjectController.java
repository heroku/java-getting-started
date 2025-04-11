package com.heroku.java.api;

import com.heroku.java.dto.SubjectDTO;
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
    public ResponseEntity<Iterable<SubjectDTO>> getAllSubjects() {
        return new ResponseEntity<>(subjectService.findAllSubjectDTOs(), HttpStatus.OK);
    }
}
