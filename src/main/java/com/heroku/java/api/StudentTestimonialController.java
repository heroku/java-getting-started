package com.heroku.java.api;

import com.heroku.java.dto.TestimonialDTO;
import com.heroku.java.services.CacheService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
public class StudentTestimonialController {
    private final CacheService cacheService;

    @GetMapping("/api/testimonials")
    public ResponseEntity<Iterable<TestimonialDTO>> getAllTestimonials() throws IOException, ClassNotFoundException {
        return new ResponseEntity<>(cacheService.getAllTestimonials(), HttpStatus.OK);
    }
}
