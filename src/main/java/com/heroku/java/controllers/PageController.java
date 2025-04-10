package com.heroku.java.controllers;

import com.heroku.java.dto.SubjectDTO;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import com.heroku.java.services.TeacherSubjectService;
import com.heroku.java.services.TestimonialService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class PageController {
    private final TeacherSubjectService teacherSubjectService;
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
        Iterable<Subject> subjects = teacherSubjectService.findAllSubjects();
        model.addAttribute("subjectOptions", subjects);
        model.addAttribute("subjects", subjects);
        return "contact";
    }

    @GetMapping("/subjects")
    public String subjects(HttpServletRequest request, Model model) {

        // Get subjects from the service and add to the model
        model.addAttribute("subjects", teacherSubjectService.findAllSubjects());

        // Add teacher data to the model
        model.addAttribute("teachers", teacherSubjectService.findAllTeachers());

        return "subjects";
    }

    @GetMapping("/testimonials")
    public String testimonials(Model model) throws IOException, ClassNotFoundException {
        model.addAttribute("subjects", teacherSubjectService.findAllSubjects());
        var a = testimonialService.getStudentTestimonials();
        model.addAttribute("testimonials", a);
        return "testimonials";
    }

    @GetMapping("/error")
    public String error(HttpServletRequest request) {
        return "error";
    }

}