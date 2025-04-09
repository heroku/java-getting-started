package com.heroku.java.utils;

import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import com.heroku.java.services.EmailService;

import java.util.stream.Collectors;

public class EmailTemplate {
    /**
     * Generates HTML content for email messages
     *
     * @param subject Email subject
     * @param request Email request details
     * @return Formatted HTML content
     */
    public static String getMessageHtml(String subject, EmailService.EmailContactRequest request) {
        return """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="color-scheme" content="light">
    <meta name="supported-color-schemes" content="light">
    <title>%s</title>
    <style type="text/css">
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        /* Reset styles for email clients */
        html, body {
            margin: 0 !important;
            padding: 0 !important;
            height: 100%% !important;
            width: 100%% !important;
            font-family: 'Inter', Arial, sans-serif !important;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }
        
        * {
            -ms-text-size-adjust: 100%%;
            -webkit-text-size-adjust: 100%%;
            box-sizing: border-box;
        }
        
        div[style*="margin: 16px 0"] { 
            margin: 0 !important; 
        }
        
        table, td {
            mso-table-lspace: 0pt !important;
            mso-table-rspace: 0pt !important;
            border-collapse: collapse !important;
        }
        
        img {
            -ms-interpolation-mode: bicubic;
            border: 0;
            height: auto;
            line-height: 100%%;
            outline: none;
            text-decoration: none;
            max-width: 100%%;
        }
        
        /* Base styles */
        body {
            background-color: #F7F9FC !important;
            color: #252F3F;
            font-family: 'Inter', Arial, sans-serif;
            font-size: 16px;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }
        
        /* Container styles */
        .email-container {
            max-width: 680px !important;
            margin: 0 auto !important;
            padding: 0 !important;
            background: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
        }
        
        /* Header styles */
        .header {
            background: linear-gradient(135deg, #0F3460 0%%, #022E57 100%%);
            padding: 40px 40px 50px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .header:before {
            content: '';
            position: absolute;
            top: -10%%;
            left: -10%%;
            width: 120%%;
            height: 120%%;
            background: url('https://sam-technology.org/email-assets/header-pattern.png');
            background-size: cover;
            opacity: 0.05;
            z-index: 0;
        }
        
        .header-content {
            position: relative;
            z-index: 1;
        }
        
        .logo {
            display: block;
            margin: 0 auto 20px;
            max-width: 200px;
            height: auto;
        }
        
        .header h1 {
            color: #ffffff;
            font-size: 32px;
            font-weight: 700;
            margin: 10px 0 0;
            letter-spacing: -0.5px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        /* Content styles */
        .content {
            padding: 50px 50px 35px;
            background: #ffffff;
            position: relative;
        }
        
        .greeting {
            margin-bottom: 25px;
            font-size: 18px;
        }
        
        .personalized {
            color: #0F3460;
            font-weight: 600;
        }
        
        p {
            margin: 0 0 25px;
            font-size: 16px;
            color: #374151;
            line-height: 1.7;
        }
        
        /* Info box styles */
        .info-box {
            margin: 35px 0;
            border-radius: 12px;
            position: relative;
            padding: 30px;
        }
        
        .contact-details {
            background-color: #F3F8FF;
            border-left: 5px solid #1E40AF;
            box-shadow: 0 4px 20px rgba(30, 64, 175, 0.05);
        }
        
        .teacher-info {
            background-color: #F0FAFF;
            border-left: 5px solid #0D9488;
            box-shadow: 0 4px 20px rgba(13, 148, 136, 0.05);
        }
        
        .info-box h3 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: 600;
            letter-spacing: -0.3px;
        }
        
        .contact-details h3 {
            color: #1E40AF;
        }
        
        .teacher-info h3 {
            color: #0D9488;
        }
        
        .info-box p {
            margin: 12px 0;
            font-size: 15px;
            display: flex;
            align-items: baseline;
        }
        
        .info-box strong {
            min-width: 80px;
            display: inline-block;
            color: #4B5563;
        }
        
        /* Highlight styles */
        .highlight {
            background-color: #FFFAEB;
            color: #92400E;
            padding: 4px 8px;
            border-radius: 4px;
            font-weight: 600;
            display: inline-block;
            border-left: 3px solid #F59E0B;
        }
        
        /* Button styles */
        .button-wrapper {
            text-align: center;
            margin: 35px 0 25px;
        }
        
        .button {
            background: linear-gradient(to right, #1E40AF, #3B82F6);
            color: #ffffff !important;
            text-decoration: none;
            padding: 16px 35px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 16px;
            display: inline-block;
            text-align: center;
            mso-padding-alt: 18px 35px;
            transition: transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 6px 15px rgba(59, 130, 246, 0.25);
        }
        
        .button:hover {
            background: linear-gradient(to right, #1A365D, #1E40AF);
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.35);
            transform: translateY(-2px);
        }
        
        /* Divider styles */
        .divider {
            height: 1px;
            background-color: #E5EAEF;
            margin: 35px 0;
            border: none;
        }
        
        /* Subject tag styles */
        .subject-tag {
            display: inline-block;
            background-color: #EBF5FF;
            color: #1E40AF;
            padding: 6px 12px;
            border-radius: 40px;
            font-size: 14px;
            font-weight: 500;
            margin-top: 5px;
            margin-right: 8px;
            margin-bottom: 5px;
            border: 1px solid rgba(59, 130, 246, 0.15);
        }
        
        /* Contact info styles */
        .quick-contact {
            background-color: #F9FAFB;
            padding: 25px 30px;
            border-radius: 12px;
            margin: 35px 0 25px;
        }
        
        .contact-method {
            display: flex;
            align-items: center;
            margin: 12px 0;
        }
        
        .contact-icon {
            width: 24px;
            text-align: center;
            margin-right: 15px;
            color: #4B5563;
            font-weight: bold;
        }
        
        /* Signature styles */
        .signature {
            margin-top: 35px;
        }
        
        .signature-name {
            font-weight: 700;
            color: #252F3F;
            font-size: 16px;
        }
        
        /* Footer styles */
        .footer {
            text-align: center;
            padding: 35px 40px;
            background-color: #F7F9FC;
            border-top: 1px solid #E5EAEF;
        }
        
        .footer p {
            margin: 0 0 10px;
            font-size: 14px;
            color: #6B7280;
        }
        
        .social-links {
            margin: 25px 0 15px;
        }
        
        .social-links a {
            display: inline-block;
            margin: 0 8px;
            color: #3B82F6;
            text-decoration: none;
            font-weight: 500;
            font-size: 14px;
            transition: color 0.3s;
        }
        
        .social-links a:hover {
            color: #1E40AF;
            text-decoration: underline;
        }
        
        .footer-logo {
            max-width: 140px;
            margin: 0 auto 20px;
            opacity: 0.8;
        }
        
        .small-text {
            font-size: 13px;
            color: #9CA3AF;
            margin-top: 20px;
        }
        
        /* Dark mode support */
        @media (prefers-color-scheme: dark) {
            body {
                background-color: #1E1E1E !important;
            }
            .email-container {
                background-color: #252525 !important;
            }
            .content {
                background-color: #252525 !important;
            }
            p {
                color: #E5E7EB !important;
            }
            .contact-details {
                background-color: #2D3748 !important;
            }
            .teacher-info {
                background-color: #2C3A47 !important;
            }
            .highlight {
                background-color: #3F2E1F !important;
                color: #FBBF24 !important;
            }
            .footer {
                background-color: #1F1F1F !important;
                border-top: 1px solid #333333 !important;
            }
            .footer p {
                color: #9CA3AF !important;
            }
            .divider {
                background-color: #4B5563 !important;
            }
            .quick-contact {
                background-color: #2D3748 !important;
            }
            .info-box strong {
                color: #D1D5DB !important;
            }
        }
        
        /* Mobile responsive styles */
        @media screen and (max-width: 600px) {
            .email-container {
                width: 100%% !important;
                border-radius: 0 !important;
            }
            
            .header, .content, .footer {
                padding: 30px 25px !important;
            }
            
            .header h1 {
                font-size: 26px !important;
            }
            
            .info-box {
                padding: 20px !important;
                margin: 25px 0 !important;
            }
            
            .button {
                display: block !important;
                padding: 16px !important;
                width: 100%% !important;
                max-width: none !important;
            }
            
            .contact-method {
                flex-direction: column !important;
                align-items: flex-start !important;
            }
            
            .contact-icon {
                margin-bottom: 5px !important;
            }
        }
    </style>
</head>
<body>
    <div style="background-color: #F7F9FC; padding: 30px 10px;">
        <!-- Email Container -->
        <table align="center" role="presentation" cellspacing="0" cellpadding="0" border="0" width="100%%" style="max-width: 680px;" class="email-container">
            <!-- Header -->
            <tr>
                <td class="header">
                    <div class="header-content">
                        <img src="https://sam-technology.org/logo.png" alt="Sam Technology" class="logo" width="200">
                        <h1>%s</h1>
                    </div>
                </td>
            </tr>
            
            <!-- Content -->
            <tr>
                <td class="content">
                    <!-- Greeting -->
                    <p class="greeting">Hello <span class="personalized">%s</span>,</p>
                    
                    <p>Thank you for reaching out to Sam Technology. We're delighted about your interest in our educational programs and have received your inquiry. Our team is committed to providing you with the best possible guidance for your learning journey.</p>
                    
                    <!-- Contact Details Box -->
                    <div class="info-box contact-details">
                        <h3>Your Contact Information</h3>
                        <p><strong>Name:</strong> %s</p>
                        <p><strong>Email:</strong> %s</p>
                        <p><strong>Phone:</strong> %s</p>
                        <p><strong>Message:</strong> <em>"%s"</em></p>
                    </div>
                    
                    <p>Our dedicated team is already reviewing your request, and <span class="highlight">we will get back to you within 24 hours</span> with personalized information tailored to your needs.</p>
                    
                    <!-- Teacher Info Box -->
                    <div class="info-box teacher-info">
                        <h3>Your Selected Teacher</h3>
                        <p><strong>Name:</strong> %s</p>
                        <p><strong>Subject:</strong> %s</p>
                        <p><strong>Email:</strong> <a href="mailto:%s" style="color: #3B82F6; text-decoration: none;">%s</a></p>
                        <p><strong>Phone:</strong> %s</p>
                    </div>
                    
                    <p>While you wait, we invite you to explore our comprehensive catalog of courses and learning resources on our website. Discover the full range of educational opportunities available to you:</p>
                    
                    <!-- CTA Button -->
                    <div class="button-wrapper">
                        <a href="https://sam-technology.org/subjects" class="button">Browse Our Subjects</a>
                    </div>
                    
                    <hr class="divider">
                    
                    <!-- Quick Contact -->
                    <div class="quick-contact">
                        <p style="margin-top: 0; margin-bottom: 15px; font-weight: 600;">Have urgent questions? Contact us directly:</p>
                        
                        <div class="contact-method">
                            <span class="contact-icon">📞</span>
                            <span><strong>Call:</strong> 757-752-0752</span>
                        </div>
                        
                        <div class="contact-method">
                            <span class="contact-icon">✉️</span>
                            <span><strong>Email:</strong> <a href="mailto:info@sam-technology.org" style="color: #3B82F6; text-decoration: none;">info@sam-technology.org</a></span>
                        </div>
                    </div>
                    
                    <p>We're excited to be part of your educational journey and are committed to helping you achieve your learning goals.</p>
                    
                    <!-- Signature -->
                    <div class="signature">
                        <p>Warm regards,<br>
                        <span class="signature-name">The Sam Technology Team</span></p>
                    </div>
                </td>
            </tr>
            
            <!-- Footer -->
            <tr>
                <td class="footer">
                    <img src="https://sam-technology.org/logo-small.png" alt="Sam Technology" class="footer-logo" width="140">
                    
                    <p>© 2025 Sam Technology. All rights reserved.</p>
                    <p>Lowell, Arkansas, 72745</p>
                    
                    <div class="social-links">
                        <a href="https://facebook.com/samtechnology">Facebook</a> | 
                        <a href="https://twitter.com/samtechnology">Twitter</a> | 
                        <a href="https://instagram.com/samtechnology">Instagram</a> | 
                        <a href="https://linkedin.com/company/samtechnology">LinkedIn</a>
                    </div>
                    
                    <p class="small-text">If you received this email by mistake, please disregard it.</p>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
""".formatted(
                subject,
                subject,
                request.getContactRequest() != null ? request.getContactRequest().getFirstName() + " " + request.getContactRequest().getLastName() : "there",
                request.getContactRequest() != null ? request.getContactRequest().getFirstName() + " " + request.getContactRequest().getLastName() : "N/A",
                request.getContactRequest() != null ? request.getContactRequest().getEmail() : request.getTo(),
                request.getContactRequest() != null ? request.getContactRequest().getPhone() : "N/A",
                request.getContactRequest() != null ? request.getContactRequest().getMessage() : "N/A",
                request.getTeacher() != null ? request.getTeacher().getFirstName() + " " + request.getTeacher().getLastName() : "N/A",
                request.getTeacher() != null ? formatSubjectTags(request.getTeacher()) : "N/A",
                request.getTeacher() != null ? request.getTeacher().getEmail() : "N/A",
                request.getTeacher() != null ? request.getTeacher().getEmail() : "N/A",
                request.getTeacher() != null ? request.getTeacher().getPhone() : "N/A"
        );
    }

    /**
     * Helper method to format teacher subjects as HTML tags
     */
    private static String formatSubjectTags(Teacher teacher) {
        if (teacher == null || teacher.getSubjects() == null || teacher.getSubjects().isEmpty()) {
            return "<span class=\"subject-tag\">N/A</span>";
        }
        return teacher.getSubjects().stream()
                .map(subject -> "<span class=\"subject-tag\">" + subject.getName() + "</span>")
                .collect(Collectors.joining(" "));
    }
}