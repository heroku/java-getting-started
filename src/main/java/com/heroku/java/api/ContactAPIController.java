package com.heroku.java.api;

import com.heroku.java.dto.ContactForm;
import com.heroku.java.models.ContactRequest;
import com.heroku.java.models.Subject;
import com.heroku.java.services.ContactRequestService;
import com.heroku.java.services.SubjectService;
import com.heroku.java.services.TeacherService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Controller for handling contact form submissions.
 */
@Controller
@RequiredArgsConstructor
public class ContactAPIController {

    private static final Logger logger = Logger.getLogger(ContactAPIController.class.getName());

    private final ContactRequestService contactRequestService;
    private final SubjectService subjectService;
    private final TeacherService teacherService;

    /**
     * Handles the contact form submission from the website.
     * Processing the form data sent via AJAX with URLSearchParams format.
     *
     * @param name The full name of the contact
     * @param email The complete email constructed by the form
     * @param phone The phone number (optional)
     * @param subject The selected subject
     * @param message The message content
     * @return JSON response with success status and message
     */
    @PostMapping(value = "/api/contact", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Map<String, Object>> submitContactForm(
            HttpServletRequest request,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam(required = false) String phone,
            @RequestParam String subject,
            @RequestParam String message) {

        Map<String, Object> response = new HashMap<>();

        try {
            // Create a ContactForm object to maintain consistency with existing methods
            ContactForm contactForm = new ContactForm(name, email, phone, subject, message);

            logger.log(Level.INFO, "Processing contact form: {0}", contactForm);

            // Save submission to database
            saveSubmissionToDatabase(contactForm);

            // Send email notification
            sendEmailNotification(contactForm);

            // Return success response
            response.put("success", true);
            response.put("message", "Your message has been sent successfully! We'll get back to you soon.");
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error processing contact form submission", e);

            // Return error response
            response.put("success", false);
            response.put("message", "An error occurred: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    // Helper method to save the submission to a database
    private void saveSubmissionToDatabase(ContactForm submission) throws Exception {
        Subject foundSubject = subjectService.findSubjectByName(submission.getSubject());
        if(foundSubject != null) {
            String[] splitName = submission.getName().split(" ", 2); // Split into at most 2 parts

            // Handle name with proper validation
            String firstName;
            String lastName;

            if(splitName.length == 0) {
                throw new Exception("Name cannot be empty");
            } else if(splitName.length == 1) {
                // Only one name provided, use it as firstName and leave lastName empty
                firstName = splitName[0];
                lastName = ""; // or some default value
            } else {
                // We have at least two parts
                firstName = splitName[0];
                lastName = splitName[1];
            }

            ContactRequest newPerson = new ContactRequest();
            newPerson.setEmail(submission.getEmail());
            newPerson.setPhone(submission.getPhone());
            newPerson.setMessage(submission.getMessage());
            newPerson.setFirstName(firstName);
            newPerson.setLastName(lastName);
            newPerson.setSubject(foundSubject);

            contactRequestService.savePerson(newPerson);
            logger.log(Level.INFO, "Saved submission to database: {0}", submission);
        } else {
            throw new Exception("Subject not found: " + submission.getSubject());
        }
    }

    // Helper method to send an email notification
    private void sendEmailNotification(ContactForm submission) {
        // Implementation would depend on your email service
        // Could use JavaMail API, Spring Mail, etc.

        // For demonstration, we're just logging
        logger.log(Level.INFO, "Sending email notification for: {0}", submission.getEmail());
    }
}