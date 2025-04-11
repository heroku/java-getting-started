package com.heroku.java.api;

import com.heroku.java.dto.TestimonialDTO;
import com.heroku.java.services.TestimonialService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class StudentTestimonialController {
    private final TestimonialService testimonialService;

    @GetMapping("/api/testimonials")
    public ResponseEntity<List<TestimonialDTO>> getAllTestimonials() {
        return new ResponseEntity<>(testimonialService.getStudentTestimonialsDTO(), HttpStatus.OK);
    }
}
