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

import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;


@Service
@EnableScheduling
@RequiredArgsConstructor
public class EmailService {

    private final JavaMailSender emailSender;
    private final ContactRequestService requestService;
    private final TeacherService teacherService;

    private String messageHtml = """
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thanks for reaching out!</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333333;
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
            }
            .header {
                text-align: center;
                padding-bottom: 20px;
                border-bottom: 1px solid #eeeeee;
            }
            .logo {
                max-width: 150px;
            }
            h1 {
                color: #2c5282;
                font-size: 24px;
                margin-bottom: 20px;
            }
            .content {
                padding: 20px 0;
            }
            .footer {
                text-align: center;
                font-size: 12px;
                color: #666666;
                padding-top: 20px;
                border-top: 1px solid #eeeeee;
            }
            .button {
                display: inline-block;
                background-color: #3182ce;
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 4px;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <!-- Replace with your company logo if available -->
            <h1>Thank You for Contacting Us!</h1>
        </div>
        
        <div class="content">
            <p>Hello,</p>
            
            <p>This email is to inform you that we have received your message. We appreciate you reaching out to us.</p>
            
            <p>Our team is reviewing your inquiry and <strong>we will be in touch with you shortly</strong>.</p>
            
            <p>In the meantime, please feel free to visit our website for more information.</p>
            
            <p style="text-align: center;">
                <a href="https://www.yourwebsite.com" class="button">Visit Our Website</a>
            </p>
        </div>
        
        <div class="footer">
            <p>© 2025 Your Company Name. All rights reserved.</p>
            <p>123 Business Street, City, Country</p>
        </div>
    </body>
    </html>
    """;

    public void sendEmail(EmailContactRequest request) throws MessagingException {
        MimeMessage message = emailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        helper.setFrom(request.getFrom());

        String[] recipientList = {"samjaytaylor22@gmail.com", request.getTo()};
        helper.setTo(recipientList);
        helper.setSubject("Thanks for reaching out!");
        helper.setPriority(1);
        helper.setText(messageHtml, true);

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
    }
}