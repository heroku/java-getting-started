<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
      <jsp:include page="../components/headElements.jsp" />
    <title>Contact Me - Teacher Profile</title>
</head>
<body>
       <jsp:include page="../components/header.jsp" />

    <!-- Main Content -->
    <main>
        <!-- Contact Section -->
        <section class="contact" id="contact">
            <div class="container">
                <div class="section-header">
                    <h2>Get In Touch</h2>
                    <p>Have questions or ready to start learning? Contact me today!</p>
                </div>
                <div class="contact-container">
                    <div class="contact-info">
                        <h3>Contact Information</h3>
                        <ul class="contact-details">
                            <li>
                                <i class="fas fa-map-marker-alt"></i>
                                <div>
                                    <strong>Location:</strong>
                                    <p>${not empty contactInfo ? contactInfo.location : 'Lowell, Arkansas(US)'}</p>
                                    <p>In-person and online sessions available</p>
                                </div>
                            </li>
                            <li>
                                <i class="fas fa-envelope"></i>
                                <div>
                                    <strong>Email:</strong>
                                    <p>${not empty contactInfo ? contactInfo.email : 'samjaytaylor22@gmail.com'}</p>
                                </div>
                            </li>
                            <li>
                                <i class="fas fa-phone"></i>
                                <div>
                                    <strong>Phone:</strong>
                                    <p>${not empty contactInfo ? contactInfo.phone : '(757)-752-0752'}</p>
                                </div>
                            </li>
                            <li>
                                <i class="fas fa-clock"></i>
                                <div>
                                    <strong>Teaching Hours:</strong>
                                    <p>${not empty contactInfo ? contactInfo.weekdayHours : 'Monday - Friday: 3:00 PM - 8:00 PM'}</p>
                                    <p>${not empty contactInfo ? contactInfo.weekendHours : 'Saturday: 9:00 AM - 3:00 PM'}</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="contact-form">
                        <form action="${pageContext.request.contextPath}/api/contact" method="POST" id="contactForm">
                            <div id="errorMessage" class="error-message" style="display: none;"></div>
                            <div id="loadingIndicator" class="loading-indicator" style="display: none;">
                                <i class="fas fa-spinner fa-spin"></i> Sending message...
                            </div>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" id="name" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" id="email" name="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone (Optional)</label>
                                <input type="tel" id="phone" name="phone" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="subject">Subject</label>
                                <select id="subject" name="subject" class="form-control" required>
                                    <option value="">Select Subject</option>
                                    <c:if test="${not empty subjectOptions}">
                                        <c:forEach var="subj" items="${subjectOptions}">
                                            <option value="${subj.name}">${subj.name}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea id="message" name="message" class="form-control" required></textarea>
                            </div>
                            <button type="submit" class="btn" id="submitButton">Send Message</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </main>

       <jsp:include page="../components/footer.jsp" />

    <style>
        .loading-indicator {
            text-align: center;
            padding: 10px;
            margin-bottom: 15px;
            color: #3498db;
            font-weight: bold;
        }

        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
            border: 1px solid #f5c6cb;
        }

        /* Disable form styling */
        form.submitting input,
        form.submitting textarea,
        form.submitting select,
        form.submitting button {
            opacity: 0.7;
            cursor: not-allowed;
        }
    </style>

    <script>
    $(document).ready(function() {
        // Flag to prevent multiple submissions
        let isSubmitting = false;

        // Form submission handling
        $('#contactForm').submit(function(event) {
            // Prevent default form submission
            event.preventDefault();

            // If already submitting, don't submit again
            if (isSubmitting) {
                return false;
            }

            // Set submitting flag
            isSubmitting = true;

            // Visual feedback
            $('#contactForm').addClass('submitting');
            $('#submitButton').prop('disabled', true).html('<i class="fas fa-spinner fa-spin"></i> Sending...');
            $('#loadingIndicator').show();
            $('#errorMessage').hide();

            // Collect form data
            var formData = $(this).serialize();

            // Submit the form via AJAX
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/api/contact',
                data: formData,
                success: function(response) {
                    if (response.status === 'success') {
                        // Store message in sessionStorage
                        sessionStorage.setItem('contactMessage', response.message);
                        // Redirect to success page - use window.location.replace to prevent back button returning to form
                        window.location.replace('${pageContext.request.contextPath}/contact-success');
                    } else {
                        // Show error message on the same page
                        $('#errorMessage').text(response.message || 'An error occurred').show();
                        resetForm();
                    }
                },
                error: function(xhr) {
                    // Handle error response
                    var errorMsg = 'An error occurred while processing your request.';
                    try {
                        var response = JSON.parse(xhr.responseText);
                        if (response.message) {
                            errorMsg = response.message;
                        }
                    } catch(e) {
                        // Use default error message if parsing fails
                    }
                    $('#errorMessage').text(errorMsg).show();
                    resetForm();
                }
            });
        });

        function resetForm() {
            // Reset submission state
            isSubmitting = false;
            $('#contactForm').removeClass('submitting');
            $('#submitButton').prop('disabled', false).html('Send Message');
            $('#loadingIndicator').hide();
        }

        // Header scroll effect
        window.addEventListener('scroll', function() {
            const header = document.querySelector('header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    });
    </script>
</body>
</html>