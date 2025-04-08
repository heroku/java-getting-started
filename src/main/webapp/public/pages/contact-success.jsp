<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../components/headElements.jsp" />
    <title>Message Sent - Teacher Profile</title>
</head>
<body>
    <jsp:include page="../components/header.jsp" />

    <!-- Main Content -->
    <main>
        <section class="success-section">
            <div class="container">
                <div class="success-container">
                    <div class="icon-container">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <h1>Message Sent!</h1>
                    <div id="successMessage">
                        <p>Your message has been received. We'll contact you shortly!</p>
                    </div>
                    <div class="buttons">
                        <a href="${pageContext.request.contextPath}/" class="btn">Return to Home</a>
                        <a href="${pageContext.request.contextPath}/subjects" class="btn btn-outline">View Subjects</a>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <jsp:include page="../components/footer.jsp" />

    <style>
        .success-section {
            padding: 60px 0;
            min-height: 70vh;
            display: flex;
            align-items: center;
        }

        .success-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 40px;
            text-align: center;
            max-width: 600px;
            margin: 0 auto;
        }

        .icon-container {
            margin-bottom: 20px;
        }

        .icon-container i {
            font-size: 80px;
            color: #4CAF50;
        }

        .success-container h1 {
            margin-bottom: 20px;
            color: #333;
        }

        .success-container p {
            font-size: 18px;
            color: #666;
            margin-bottom: 30px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .btn {
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        .btn-outline {
            background-color: transparent;
            border: 2px solid #3498db;
            color: #3498db;
        }

        .btn-outline:hover {
            background-color: #3498db;
            color: white;
        }
    </style>

    <script>
        $(document).ready(function() {
            // Get message from session storage if available
            const message = sessionStorage.getItem('contactMessage');
            if (message) {
                $('#successMessage p').text(message);
                // Clear the message from session storage to prevent it showing again on refresh
                sessionStorage.removeItem('contactMessage');
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