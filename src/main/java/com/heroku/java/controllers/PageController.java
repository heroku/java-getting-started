package com.heroku.java.controllers;

import com.heroku.java.dto.SubjectDTO;
import com.heroku.java.services.SubjectService;
import com.heroku.java.services.TeacherService;
import com.heroku.java.services.TestimonialService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class PageController {
    private final SubjectService subjectService;
    private final TeacherService teacherService;
    private final TestimonialService testimonialService;

    @GetMapping("/")
    public String index(HttpServletRequest request) {
        return "index";
    }

    @GetMapping("/about")
    public String about(HttpServletRequest request) {
        return "about";
    }

    @GetMapping("/contact")
    public String contact(HttpServletRequest request, Model model) {
        Iterable<SubjectDTO> subjects = subjectService.findAllSubjectDTOs();
        model.addAttribute("subjectOptions", subjects);
        model.addAttribute("subjects", subjects);
        return "contact";
    }

    @GetMapping("/subjects")
    public String subjects(HttpServletRequest request, Model model) {

        // Get subjects from the service and add to the model
        model.addAttribute("subjects", subjectService.findAllSubjectDTOs());

        // Add teacher data to the model
        model.addAttribute("teachers", teacherService.findAllTeacherDTOs());

        return "subjects";
    }

    @GetMapping("/testimonials")
    public String testimonials(Model model) throws IOException, ClassNotFoundException {
        model.addAttribute("subjects", subjectService.findAllSubjectDTOs());
        var a = testimonialService.getStudentTestimonialsDTO();
        model.addAttribute("testimonials", a);
        return "testimonials";
    }

    @GetMapping("/error")
    public String error(HttpServletRequest request) {
        return "error";
    }

}