package com.heroku.java.services;

import com.heroku.java.dto.TestimonialDTO;
import com.heroku.java.interfaces.IStudentTestimonials;
import com.heroku.java.models.StudentTestimonials;
import io.lettuce.core.api.sync.RedisCommands;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
@RequiredArgsConstructor
public class TestimonialService {
    private final IStudentTestimonials studentTestimonials;
    private final RedisCommands<String, TestimonialDTO> oneCommand;
    private final RedisCommands<String, List<TestimonialDTO>> twoCommand;

    public TestimonialDTO getTestimonialDTOById(long id) {
        TestimonialDTO testimonial = oneCommand.get(String.valueOf(id));
        if (testimonial != null) {
            return testimonial;
        }

        StudentTestimonials t = studentTestimonials.findById(id).orElse(null);
        if (t instanceof StudentTestimonials) {
            TestimonialDTO stmnl = convertStudentTestimonialToDTO(t);
            oneCommand.set(String.valueOf(id), stmnl);
            return stmnl;
        }

        return null;
    }

    public List<TestimonialDTO> getStudentTestimonialsDTO(){
        List<TestimonialDTO> list = twoCommand.get("getStudentTestimonialsDTO");
        if(list != null) {
            return list;
        }


        List<TestimonialDTO> dtos = StreamSupport.stream(studentTestimonials.findAll().spliterator(), true)
                    .map(this::convertStudentTestimonialToDTO).collect(Collectors.toList());
        twoCommand.set("getStudentTestimonialsDTO", dtos);
        return dtos;
    }

      private TestimonialDTO convertStudentTestimonialToDTO(StudentTestimonials studentTestimonials) {
        TestimonialDTO dto = new TestimonialDTO();
        dto.setTestimonial(studentTestimonials.getTestimonial());
        dto.setRating(studentTestimonials.getRating());
        dto.setDate(studentTestimonials.getDate());
        dto.setFirstName(studentTestimonials.getFirstName());
        dto.setLastName(studentTestimonials.getLastName());
        dto.setSubject(studentTestimonials.getSubject());
        return dto;
    }
}
