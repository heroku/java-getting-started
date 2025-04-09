package com.heroku.java.controllers;

import com.heroku.java.dto.TeacherDTO;
import com.heroku.java.models.Subject;
import com.heroku.java.services.SubjectService;
import com.heroku.java.services.TeacherSubjectService;
import com.heroku.java.services.VisitTrackingService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class PageController {
    private final TeacherSubjectService teacherSubjectService;
    private final VisitTrackingService visitTrackingService;

    @GetMapping("/")
    public String index(HttpServletRequest request) {
        visitTrackingService.trackVisit(request);
        return "index";
    }

    @GetMapping("/about")
    public String about(HttpServletRequest request) {
        visitTrackingService.trackVisit(request);
        return "about";
    }

    @GetMapping("/contact")
    public String contact(HttpServletRequest request, Model model) {
        visitTrackingService.trackVisit(request);
        model.addAttribute("subjectOptions", teacherSubjectService.findAllSubjects());
        return "contact";
    }

    @GetMapping("/subjects")
    public String subjects(HttpServletRequest request, Model model) {
        visitTrackingService.trackVisit(request);
        // Get subjects from the service and add to the model
        Iterable<Subject> subjects = teacherSubjectService.findAllSubjects();
        model.addAttribute("subjects", subjects);

        // Add teacher data to the model
        model.addAttribute("teachers", teacherSubjectService.findAllTeachers());

        return "subjects";
    }

    @GetMapping("/error")
    public String error(HttpServletRequest request) {
        visitTrackingService.trackVisit(request);
        return "error";
    }
}