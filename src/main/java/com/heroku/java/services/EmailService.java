package com.heroku.java.services;

import com.heroku.java.dto.TeacherDTO;
import com.heroku.java.models.ContactRequest;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import static com.heroku.java.utils.EmailTemplate.getMessageHtml;

@Service
@EnableScheduling
@EnableAsync
@RequiredArgsConstructor
@Slf4j
public class EmailService {

    private final JavaMailSender emailSender;
    private final ContactRequestService requestService;
    private final TeacherService teacherService;
    /**
     * Sends an email asynchronously
     *
     * @param request Email request details
     * @return CompletableFuture with void result
     */
    @Async
    public CompletableFuture<Void> sendEmailAsync(EmailContactRequest request) {
        return CompletableFuture.runAsync(() -> {
            try {
                MimeMessage message = emailSender.createMimeMessage();
                MimeMessageHelper helper = new MimeMessageHelper(message, true);
                helper.setFrom(request.getFrom());

                // Send to both teacher and requestor
                String[] recipientList = {request.getTeacher().getEmail(), request.getTo()};
                helper.setTo(recipientList);

                String subject = "Thanks for reaching out to Sam Technology!";
                helper.setSubject(subject);
                helper.setPriority(1);
                helper.setText(getMessageHtml(subject, request), true);

                emailSender.send(message);
                log.info("Email sent successfully to {} and {}",
                        request.getTeacher().getEmail(), request.getTo());
            } catch (MessagingException e) {
                log.error("Failed to send email: {}", e.getMessage(), e);
                throw new RuntimeException("Failed to send email", e);
            }
        });
    }

    /**
     * Legacy synchronous method for backward compatibility
     */
    public void sendEmail(EmailContactRequest request) throws MessagingException {
        try {
            sendEmailAsync(request).get(); // Wait for completion
        } catch (Exception e) {
            if (e.getCause() instanceof MessagingException) {
                throw (MessagingException) e.getCause();
            }
            throw new RuntimeException("Failed to send email", e);
        }
    }

    /**
     * Scheduled task that runs every minute to process unsent contact requests
     */
    @Scheduled(fixedDelay = 1, timeUnit = TimeUnit.MINUTES)
    public void sendEmailScheduled() {
        try {
            List<ContactRequest> requests = (List<ContactRequest>) requestService.findAllUnsentRequests();
            if (requests.isEmpty()) {
                log.debug("No unsent contact requests found");
                return;
            }

            log.info("Processing {} unsent contact requests", requests.size());
            TeacherDTO teacher = teacherService.findTeacherDTOById(1L);

            // Process emails asynchronously but collect futures
            List<CompletableFuture<Void>> futures = requests.stream()
                    .map(request -> {
                        EmailContactRequest contactRequest = new EmailContactRequest();
                        contactRequest.setTo(request.getEmail());
                        contactRequest.setFrom(teacher.getEmail());
                        contactRequest.setContactRequest(request);
                        contactRequest.setTeacher(teacher);

                        // Send email and mark as read when complete
                        return sendEmailAsync(contactRequest)
                                .thenRun(() -> {
                                    request.setRead(true);
                                    requestService.updatePerson(request);
                                    log.debug("Request marked as read: {}", request.getId());
                                })
                                .exceptionally(ex -> {
                                    log.error("Failed to process request {}: {}",
                                            request.getId(), ex.getMessage(), ex);
                                    return null;
                                });
                    })
                    .toList();

            // Wait for all emails to complete (optional - remove if you want full async)
            CompletableFuture.allOf(futures.toArray(new CompletableFuture[0])).join();
            log.info("Completed processing {} contact requests", requests.size());

        } catch (Exception e) {
            log.error("Error in scheduled email task: {}", e.getMessage(), e);
        }
    }

    @Data
    public static class EmailContactRequest {
        private String from;
        private String to;
        private TeacherDTO teacher;
        private ContactRequest contactRequest;
    }
}