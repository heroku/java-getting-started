package com.heroku.java.services;

import com.heroku.java.interfaces.IStudentTestimonials;
import com.heroku.java.models.StudentTestimonials;
import com.heroku.java.models.Subject;
import com.heroku.java.utils.RedisCacheConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Example;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TestimonialService {
    private final IStudentTestimonials studentTestimonials;

    @Cacheable("testimonials")
    public StudentTestimonials getTestimonialById(long id) {
        return studentTestimonials.findById(id).orElse(null);
    }

    @Cacheable("testimonials")
    public Iterable<StudentTestimonials> getStudentTestimonials(){
        return studentTestimonials.findAll();
    }
}
