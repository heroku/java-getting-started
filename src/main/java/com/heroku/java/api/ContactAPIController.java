package com.heroku.java.api;

import com.heroku.java.dto.ContactForm;
import com.heroku.java.models.ContactRequest;
import com.heroku.java.models.Subject;
import com.heroku.java.services.ContactRequestService;
import com.heroku.java.services.SubjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RestController;

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

    /**
     * Handles the contact form submission from the website.
     *
     * @param contactRequest request from form to contact teacher
     * @return ResponseEntity with status and message
     */
    @PostMapping("/api/contact")
    public String submitContactForm(ContactForm contactRequest, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "redirect:/error"; // Return to the form page
        }

        try {
            // Your existing logic...
            saveSubmissionToDatabase(contactRequest);
            sendEmailNotification(contactRequest);

            // Redirect to the success page
            return "redirect:/contact-success";
        } catch (Exception e) {
            logger.log(Level.SEVERE, "Error processing contact form submission", e);
            return  "redirect:/error"; // Return to the form page on error
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
            logger.log(Level.INFO, "Saving submission to database: {0}", submission);
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