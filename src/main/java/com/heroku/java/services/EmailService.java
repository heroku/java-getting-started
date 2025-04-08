package com.heroku.java.services;

import com.heroku.java.models.ContactRequest;
import com.heroku.java.models.Teacher;
import jakarta.annotation.PostConstruct;
import jakarta.mail.Address;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Service
@EnableScheduling
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender emailSender;
    private final ContactRequestService requestService;
    private final TeacherService teacherService;


    private String getMessageHtml(String subject, EmailContactRequest request) {
        return """
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>%s</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        line-height: 1.6;
                        color: #333333;
                        max-width: 600px;
                        margin: 0 auto;
                        padding: 20px;
                        background-color: #f9f9f9;
                    }
                    .container {
                        background-color: #ffffff;
                        border-radius: 8px;
                        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                        overflow: hidden;
                    }
                    .header {
                        text-align: center;
                        padding: 25px 20px;
                        background-color: #2c5282;
                        color: white;
                    }
                    .logo {
                        max-width: 150px;
                        margin-bottom: 15px;
                    }
                    h1 {
                        font-size: 24px;
                        margin: 0;
                        color: white;
                    }
                    .content {
                        padding: 30px 25px;
                    }
                    .footer {
                        text-align: center;
                        font-size: 12px;
                        color: #666666;
                        padding: 20px;
                        background-color: #f5f5f5;
                    }
                    .button {
                        display: inline-block;
                        background-color: #3182ce;
                        color: white;
                        text-decoration: none;
                        padding: 12px 24px;
                        border-radius: 4px;
                        margin-top: 20px;
                        font-weight: bold;
                        transition: background-color 0.3s;
                    }
                    .button:hover {
                        background-color: #2c5282;
                    }
                    .personalized {
                        font-weight: bold;
                        color: #2c5282;
                    }
                    .social-links {
                        margin-top: 15px;
                    }
                    .social-links a {
                        display: inline-block;
                        margin: 0 10px;
                        color: #3182ce;
                        text-decoration: none;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <div class="header">
                        <!-- Replace with your company logo if available -->
                        <h1>%s</h1>
                    </div>
                
                    <div class="content">
                        <p>Hello <span class="personalized">%s</span>,</p>
                
                        <p>Thank you for contacting us. We've received your message and appreciate your interest.</p>
                
                        <p>Our team is reviewing your inquiry and <strong>we will get back to you within 24 hours</strong>.</p>
                
                        <p>In the meantime, feel free to explore our available courses and learning resources on our website.</p>
                
                        <p style="text-align: center;">
                            <a href="https://sam-technology.org/subjects" class="button">Browse Our Subjects</a>
                        </p>
                        
                        <p>If you have any urgent questions, please don't hesitate to call us at <strong>757-752-0752</strong>.</p>
                    </div>
                
                    <div class="footer">
                        <p>© 2025 Sam Technology. All rights reserved.</p>
                        <p>2315 Hickory Wood Ave Lowell Arkansas, 72745</p>
                    </div>
                </div>
            </body>
            </html>
            """.formatted(
                subject,
                subject,
                request.getContactRequest() != null ? request.getContactRequest().getFirstName() + request.getContactRequest().getLastName() : "there"
        );
    }

    public void sendEmail(EmailContactRequest request) throws MessagingException {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setFrom(request.getFrom());

        String[] recipientList = {"samjaytaylor22@gmail.com", request.getTo()};
        helper.setTo(recipientList);

        String subject = "Thanks for reaching out to Sam Technology!";
        helper.setSubject(subject);
        helper.setPriority(1);
        helper.setText(getMessageHtml(subject, request), true);

        emailSender.send(message);
    }

    @Scheduled(fixedDelay = 1, timeUnit = TimeUnit.MINUTES)
    public void sendEmailScheduled() throws MessagingException {
        List<ContactRequest> requests = (List<ContactRequest>) requestService.findAllUnsentRequests();
        Teacher teacher = teacherService.findTeacherById(Long.valueOf(1));
        requests.stream().parallel().forEach(request -> {
            EmailContactRequest contactRequest = new EmailContactRequest();
            contactRequest.setTo(request.getEmail());
            contactRequest.setFrom(teacher.getEmail());
            contactRequest.setContactRequest(request);
            contactRequest.setTeacher(teacher);
            try {
                sendEmail(contactRequest);
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

            request.setRead(true);
            requestService.updatePerson(request);
        });
    }
    @Data
    public static class EmailContactRequest{
        private String from;
        private String to;
        private Teacher teacher;
        private ContactRequest contactRequest;
    }
}