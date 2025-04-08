package com.heroku.java.controllers;

import com.heroku.java.dto.TeacherDTO;
import com.heroku.java.models.Subject;
import com.heroku.java.services.SubjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class PageController {
    private final SubjectService subjectService;

    @GetMapping("/")
    public String index() {
         return "index";
    }

    @GetMapping("/contact-success")
    public String showSuccessPage() {
        return "contact-success";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact(Model model) {
        model.addAttribute("subjectOptions", subjectService.findAllSubjects());
        return "contact";
    }

    @GetMapping("/subjects")
    public String subjects(Model model) {
        // Get subjects from the service and add to the model
        Iterable<Subject> subjects = subjectService.findAllSubjects();
        model.addAttribute("subjects", subjects);

        // Add teacher data to the model
        model.addAttribute("teacher", createTeacherData());

        return "subjects";
    }

    @GetMapping("/error")
    public String error() {
        return "error";
    }

    // Create teacher data using a proper DTO class
    private TeacherDTO createTeacherData() {
        return TeacherDTO.builder()
                .firstName("Samuel")
                .lastName("Taylor")
                .email("admin@sam-technology.org")
                .phone("(757) 752-0752")
                .introduction("I am a passionate educator with expertise in Mathematics and Computer Science. " +
                        "My teaching philosophy centers around practical application and personalized learning experiences tailored to each student's needs.")
                .additionalInfo("With years of experience in both education and industry, I bring real-world context to abstract concepts, " +
                        "making learning both relevant and engaging.")
                .build();
    }
}