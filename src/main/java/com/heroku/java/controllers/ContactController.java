package com.heroku.java.controllers;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Controller for handling contact form submissions.
 */
@Controller
public class ContactController {

    private static final Logger logger = Logger.getLogger(ContactController.class.getName());

    /**
     * Handles the contact form submission from the website.
     *
     * @param name     The name of the person contacting
     * @param email    The email address of the person
     * @param phone    Optional phone number
     * @param subject  The selected subject from the form
     * @param message  The message content
     * @return ResponseEntity with status and message
     */
    @PostMapping("/contact")
    @ResponseBody
    public ResponseEntity<Map<String, String>> submitContactForm(
            String name,
            String email,
            String phone,
            String subject,
            String message) {

        Map<String, String> response = new HashMap<>();

        try {
            // Log the form submission
            logger.log(Level.INFO, "Contact form submission received from: {0}", email);

            // Create a contact submission object (you would typically save this to a database)
            ContactSubmission submission = new ContactSubmission(name, email, phone, subject, message);

            // Here you would typically:
            // 1. Save to database
            saveSubmissionToDatabase(submission);

            // 2. Send email notification
            sendEmailNotification(submission);

            // Respond with success
            response.put("status", "success");
            response.put("message", "Your message has been received. We'll contact you shortly!");
            return new ResponseEntity<>(response, HttpStatus.OK);

        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error processing contact form submission", e);
            response.put("status", "error");
            response.put("message", "Failed to process your request. Please try again later.");
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // Helper method to save the submission to a database
    private void saveSubmissionToDatabase(ContactSubmission submission) {
        // Implementation would depend on your persistence layer
        // This could use JPA, JDBC, etc.

        // For example with a ContactSubmissionRepository (Spring Data JPA):
        // contactSubmissionRepository.save(submission);

        // For demonstration, we're just logging
        logger.log(Level.INFO, "Saving submission to database: {0}", submission);
    }

    // Helper method to send an email notification
    private void sendEmailNotification(ContactSubmission submission) {
        // Implementation would depend on your email service
        // Could use JavaMail API, Spring Mail, etc.

        // For demonstration, we're just logging
        logger.log(Level.INFO, "Sending email notification for: {0}", submission.getEmail());
    }

    /**
     * Simple POJO class to represent a contact form submission.
     */
    @Data
    @RequiredArgsConstructor
    public static class ContactSubmission {
        private final String name;
        private final String email;
        private final String phone;
        private final String subject;
        private final String message;
        private final long timestamp = getTimestamp();

        @Override
        public String toString() {
            return "ContactSubmission{" +
                    "name='" + name + '\'' +
                    ", email='" + email + '\'' +
                    ", subject='" + subject + '\'' +
                    ", timestamp=" + timestamp +
                    '}';
        }
    }
}