<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../components/headElements.jsp" />
    <title>Contact Us - Teacher Profile</title>
    <style>
        /* Enhanced styling for the contact page */
        .contact {
            padding: 80px 0;
            background-color: #f9f9f9;
        }

        .section-header {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-header h2 {
            color: #2c3e50;
            font-size: 36px;
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
        }

        .section-header h2:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: #3498db;
        }

        .section-header p {
            color: #7f8c8d;
            font-size: 18px;
        }

        .contact-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        .contact-form {
            flex: 1;
            max-width: 600px;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #34495e;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }

        .email-input-container {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 8px;
        }

        .email-prefix {
            flex: 1;
            min-width: 150px;
        }

        .email-separator {
            font-weight: bold;
            color: #34495e;
        }

        .email-domain {
            width: auto;
            min-width: 130px;
        }

        .custom-domain {
            width: 100%;
            margin-top: 10px;
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 14px 25px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            width: 100%;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        .error-message {
            padding: 12px;
            background-color: #f8d7da;
            color: #721c24;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .success-message {
            padding: 12px;
            background-color: #d4edda;
            color: #155724;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .loading-indicator {
            text-align: center;
            color: #3498db;
            margin-bottom: 20px;
        }

        .message-container {
            position: relative;
        }

        .char-counter {
            position: absolute;
            bottom: 10px;
            right: 10px;
            font-size: 12px;
            color: #7f8c8d;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 150px;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .contact-form {
                padding: 20px;
            }

            .email-input-container {
                flex-direction: column;
                align-items: stretch;
            }

            .email-separator {
                display: none;
            }

            .form-control {
                padding: 10px;
            }
        }
    </style>
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
                <p>Have questions or ready to start learning? Contact our team today!</p>
            </div>
            <div class="contact-container">
                <div class="contact-form">
                    <form action="${pageContext.request.contextPath}/api/contact" method="POST" id="contactForm">
                        <div id="successMessage" class="success-message" style="display: none;">
                            <i class="fas fa-check-circle"></i> Your message has been sent successfully! We'll get back to you soon.
                        </div>
                        <div id="errorMessage" class="error-message" style="display: none;"></div>
                        <div id="loadingIndicator" class="loading-indicator" style="display: none;">
                            <i class="fas fa-spinner fa-spin"></i> Sending message...
                        </div>
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" name="name" class="form-control" required placeholder="Enter your full name">
                        </div>
                        <div class="form-group email-group">
                            <label for="emailPrefix">Email</label>
                            <div class="email-input-container">
                                <input type="text" id="emailPrefix" name="emailPrefix" class="form-control email-prefix" required placeholder="Enter your email">
                                <span class="email-separator">@</span>
                                <select id="emailDomain" name="emailDomain" class="form-control email-domain">
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="icloud.com">icloud.com</option>
                                    <option value="yahoo.com">yahoo.com</option>
                                    <option value="outlook.com">outlook.com</option>
                                    <option value="hotmail.com">hotmail.com</option>
                                    <option value="other">other</option>
                                </select>
                                <input type="text" id="customDomain" name="customDomain" class="form-control custom-domain" placeholder="Enter domain" style="display: none;">
                                <!-- Hidden field to store the complete email -->
                                <input type="hidden" id="email" name="email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone (Optional)</label>
                            <input type="tel" id="phone" name="phone" class="form-control" placeholder="(___)-___-____">
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
                        <div class="form-group message-container">
                            <label for="message">Message</label>
                            <textarea id="message" name="message" class="form-control" required
                                      placeholder="Tell us what you're looking for..." maxlength="500"></textarea>
                            <div class="char-counter"><span id="charCount">0</span>/500</div>
                        </div>
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-paper-plane"></i> Send Message
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</main>

<jsp:include page="../components/footer.jsp" />

<script>
    // Phone number formatting
    document.getElementById('phone').addEventListener('input', function(e) {
        // Get input value and remove all non-digits
        let input = this.value.replace(/\D/g, '');

        // Limit to 10 digits
        input = input.substring(0, 10);

        // Format the number as (XXX)-XXX-XXXX
        if (input.length > 0) {
            if (input.length <= 3) {
                this.value = '(' + input;
            } else if (input.length <= 6) {
                this.value = '(' + input.substring(0, 3) + ')-' + input.substring(3);
            } else {
                this.value = '(' + input.substring(0, 3) + ')-' + input.substring(3, 6) + '-' + input.substring(6);
            }
        }
    });

    // Email handling
    document.getElementById('contactForm').addEventListener('submit', function(e) {
        // Get the email components
        const emailPrefix = document.getElementById('emailPrefix').value.trim();
        let emailDomain;

        if (document.getElementById('emailDomain').value === 'other') {
            emailDomain = document.getElementById('customDomain').value.trim();
        } else {
            emailDomain = document.getElementById('emailDomain').value;
        }

        // Combine and set the complete email in the hidden field
        document.getElementById('email').value = emailPrefix + '@' + emailDomain;
    });

    // Show custom domain input when "other" is selected
    document.getElementById('emailDomain').addEventListener('change', function() {
        const customDomainInput = document.getElementById('customDomain');
        if (this.value === 'other') {
            customDomainInput.style.display = 'block';
            customDomainInput.required = true;
        } else {
            customDomainInput.style.display = 'none';
            customDomainInput.required = false;
        }
    });

    // Character counter for message
    document.getElementById('message').addEventListener('input', function() {
        const charCount = this.value.length;
        document.getElementById('charCount').textContent = charCount;
    });

    // Form submission with AJAX
    document.getElementById('contactForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Show loading indicator
        document.getElementById('loadingIndicator').style.display = 'block';
        document.getElementById('errorMessage').style.display = 'none';

        // Get form data
        const formData = new FormData(this);

        // Send AJAX request
        fetch(this.action, {
            method: 'POST',
            body: new URLSearchParams(formData),
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Hide loading indicator
                document.getElementById('loadingIndicator').style.display = 'none';

                if (data.success) {
                    // Show success message
                    document.getElementById('successMessage').style.display = 'block';
                    // Reset form
                    document.getElementById('contactForm').reset();
                    document.getElementById('charCount').textContent = '0';
                } else {
                    // Show error message
                    document.getElementById('errorMessage').textContent = data.message || 'An error occurred. Please try again.';
                    document.getElementById('errorMessage').style.display = 'block';
                }
            })
            .catch(error => {
                alert(error)
                // Hide loading indicator
                document.getElementById('loadingIndicator').style.display = 'none';

                // Show error message
                document.getElementById('errorMessage').textContent = 'An error occurred. Please try again later.';
                document.getElementById('errorMessage').style.display = 'block';
                console.error('Error:', error);
            });
    });
</script>

<style>
    /* Additional styling for contact info section */
    .contact-info {
        flex: 1;
        max-width: 400px;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .info-card {
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
        text-align: center;
        transition: transform 0.3s;
    }

    .info-card:hover {
        transform: translateY(-5px);
    }

    .info-icon {
        font-size: 24px;
        color: #3498db;
        margin-bottom: 10px;
    }

    .info-card h3 {
        color: #2c3e50;
        margin-bottom: 10px;
        font-size: 20px;
    }

    .info-card p {
        color: #7f8c8d;
        line-height: 1.6;
    }

    @media (max-width: 992px) {
        .contact-info {
            max-width: 600px;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .info-card {
            flex: 1;
            min-width: 250px;
        }
    }

    @media (max-width: 768px) {
        .contact-info {
            flex-direction: column;
        }
    }
</style>
</body>
</html>