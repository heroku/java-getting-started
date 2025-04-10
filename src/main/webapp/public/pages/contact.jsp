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
            background: linear-gradient(135deg, #f9f9f9 0%, #e0f7fa 100%);
            animation: gradientShift 15s ease infinite;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .section-header {
            text-align: center;
            margin-bottom: 50px;
            animation: fadeInDown 1s ease-out;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .section-header h2 {
            color: #1a237e;
            font-size: 36px;
            margin-bottom: 15px;
            position: relative;
            display: inline-block;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .section-header h2:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, #3498db, #2980b9);
            border-radius: 3px;
            animation: expandWidth 1s ease-out forwards;
        }

        @keyframes expandWidth {
            from { width: 0; }
            to { width: 80px; }
        }

        .section-header p {
            color: #455a64;
            font-size: 18px;
            animation: fadeIn 1.5s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .contact-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
            animation: slideUp 0.8s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .contact-form {
            flex: 1;
            max-width: 600px;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            transform: perspective(1000px) rotateY(0deg);
            backface-visibility: hidden;
        }

        .contact-form:hover {
            box-shadow: 0 15px 35px rgba(52, 152, 219, 0.2);
            transform: perspective(1000px) rotateY(2deg) translateY(-5px);
        }

        .form-group {
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .form-group:hover {
            transform: translateX(5px);
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #1e3799;
            transition: color 0.3s;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }

        .form-control:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.2);
            background-color: #fff;
            transform: translateY(-2px);
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
            color: #1e3799;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .email-domain {
            width: auto;
            min-width: 130px;
            border-color: #3498db;
            background-color: #f0f8ff;
        }

        .custom-domain {
            width: 100%;
            margin-top: 10px;
            border: 2px dashed #3498db;
            animation: borderPulse 2s infinite;
        }

        @keyframes borderPulse {
            0% { border-color: #3498db; }
            50% { border-color: #2ecc71; }
            100% { border-color: #3498db; }
        }

        .btn-submit {
            background: linear-gradient(to right, #3498db, #2980b9);
            color: white;
            border: none;
            padding: 14px 25px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.4s ease;
            width: 100%;
            margin-top: 10px;
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
            position: relative;
            overflow: hidden;
        }

        .btn-submit:before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.6s;
        }

        .btn-submit:hover {
            background: linear-gradient(to right, #2980b9, #1a5276);
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(41, 128, 185, 0.5);
        }

        .btn-submit:hover:before {
            left: 100%;
        }

        .error-message {
            padding: 12px;
            background-color: #f8d7da;
            color: #721c24;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 5px solid #dc3545;
            box-shadow: 0 3px 10px rgba(220, 53, 69, 0.2);
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-5px); }
            40%, 80% { transform: translateX(5px); }
        }

        .success-message {
            padding: 12px;
            background-color: #d4edda;
            color: #155724;
            border-radius: 8px;
            margin-bottom: 20px;
            border-left: 5px solid #28a745;
            box-shadow: 0 3px 10px rgba(40, 167, 69, 0.2);
            animation: slideDown 0.5s ease-out;
        }

        @keyframes slideDown {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .loading-indicator {
            text-align: center;
            color: #3498db;
            margin-bottom: 20px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
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
            transition: all 0.3s ease;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 150px;
            background-color: #f8f9fa;
            transition: height 0.3s ease;
        }

        textarea.form-control:focus {
            min-height: 180px;
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

    // Character counter for message with visual feedback
    document.getElementById('message').addEventListener('input', function() {
        const charCount = this.value.length;
        const maxLength = 500;
        const charCountElement = document.getElementById('charCount');
        const charCounterElement = document.querySelector('.char-counter');

        charCountElement.textContent = charCount;

        // Add visual feedback as user approaches the limit
        if (charCount > maxLength * 0.8) {
            charCounterElement.style.color = '#e74c3c';
            charCounterElement.style.fontWeight = 'bold';
        } else if (charCount > maxLength * 0.6) {
            charCounterElement.style.color = '#f39c12';
            charCounterElement.style.fontWeight = 'normal';
        } else {
            charCounterElement.style.color = '#7f8c8d';
            charCounterElement.style.fontWeight = 'normal';
        }
    });

    // Add animation to form elements on page load
    document.addEventListener('DOMContentLoaded', function() {
        const formGroups = document.querySelectorAll('.form-group');
        formGroups.forEach((group, index) => {
            group.style.opacity = '0';
            setTimeout(() => {
                group.style.transition = 'all 0.5s ease';
                group.style.opacity = '1';
                group.style.transform = 'translateX(0)';
            }, 100 * (index + 1));
        });

        // Add subtle animation to form controls on focus
        const formControls = document.querySelectorAll('.form-control');
        formControls.forEach(control => {
            control.addEventListener('focus', function() {
                this.style.transition = 'all 0.3s ease';
                this.style.transform = 'translateY(-2px)';
            });

            control.addEventListener('blur', function() {
                this.style.transform = 'translateY(0)';
            });
        });
    });

    // Form submission with AJAX and enhanced feedback
    document.getElementById('contactForm').addEventListener('submit', function(e) {
        e.preventDefault();

        // Button animation on submit
        const submitButton = this.querySelector('.btn-submit');
        submitButton.innerHTML = '<i class="fas fa-circle-notch fa-spin"></i> Sending...';
        submitButton.disabled = true;

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
                    // Show success message with animation
                    const successMsg = document.getElementById('successMessage');
                    successMsg.style.display = 'block';
                    successMsg.style.animation = 'slideDown 0.5s ease-out';

                    // Reset form
                    document.getElementById('contactForm').reset();
                    document.getElementById('charCount').textContent = '0';

                    // Scroll to success message
                    successMsg.scrollIntoView({ behavior: 'smooth', block: 'center' });
                } else {
                    // Show error message
                    const errorMsg = document.getElementById('errorMessage');
                    errorMsg.textContent = data.message || 'An error occurred. Please try again.';
                    errorMsg.style.display = 'block';
                    errorMsg.style.animation = 'shake 0.5s ease-in-out';
                }

                // Reset button
                submitButton.innerHTML = '<i class="fas fa-paper-plane"></i> Send Message';
                submitButton.disabled = false;
            })
            .catch(error => {
                // Hide loading indicator
                document.getElementById('loadingIndicator').style.display = 'none';

                // Show error message
                const errorMsg = document.getElementById('errorMessage');
                errorMsg.textContent = 'An error occurred. Please try again later.';
                errorMsg.style.display = 'block';
                errorMsg.style.animation = 'shake 0.5s ease-in-out';
                console.error('Error:', error);

                // Reset button
                submitButton.innerHTML = '<i class="fas fa-paper-plane"></i> Send Message';
                submitButton.disabled = false;
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
        background: linear-gradient(135deg, #fff 0%, #f0f8ff 100%);
        padding: 20px;
        border-radius: 15px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.08);
        text-align: center;
        transition: all 0.5s ease;
        border-top: 3px solid #3498db;
        position: relative;
        overflow: hidden;
        z-index: 1;
    }

    .info-card:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(135deg, #3498db 0%, #2c3e50 100%);
        opacity: 0;
        z-index: -1;
        transition: opacity 0.5s ease;
        border-radius: 12px;
    }

    .info-card:hover {
        transform: translateY(-10px) scale(1.03);
        box-shadow: 0 15px 30px rgba(52, 152, 219, 0.3);
    }

    .info-card:hover:before {
        opacity: 0.9;
    }

    .info-card:hover h3, .info-card:hover p {
        color: white;
    }

    .info-card:hover .info-icon {
        color: white;
        transform: scale(1.2);
    }

    .info-icon {
        font-size: 32px;
        color: #3498db;
        margin-bottom: 15px;
        transition: all 0.5s ease;
        display: inline-block;
    }

    .info-card h3 {
        color: #2c3e50;
        margin-bottom: 10px;
        font-size: 22px;
        transition: color 0.5s ease;
    }

    .info-card p {
        color: #7f8c8d;
        line-height: 1.6;
        transition: color 0.5s ease;
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