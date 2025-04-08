<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../components/headElements.jsp" />
    <title>Subjects - Teacher Profile</title>
    <style>
        .subjects-container {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            margin-top: 2rem;
        }

        .subject-card {
            flex: 1 1 300px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 1.5rem;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .subject-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
        }

        .subject-card h3 {
            color: #2c3e50;
            margin-bottom: 0.75rem;
            font-size: 1.5rem;
        }

        .subject-card p {
            color: #555;
            line-height: 1.6;
        }

        .teacher-profile {
            display: flex;
            align-items: center;
            gap: 2rem;
            margin: 3rem 0;
            padding: 2rem;
            background-color: #f8f9fa;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
        }

        .teacher-image {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .teacher-info {
            flex: 1;
        }

        .teacher-info h3 {
            margin-bottom: 1rem;
            font-size: 1.8rem;
            color: #2c3e50;
        }

        .teacher-info p {
            margin-bottom: 0.5rem;
            font-size: 1.1rem;
            color: #555;
        }

        .teacher-intro {
            margin-top: 1.5rem;
            line-height: 1.7;
        }

        .section-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .section-header h2 {
            color: #2c3e50;
            font-size: 2.2rem;
            position: relative;
            display: inline-block;
            padding-bottom: 0.5rem;
        }

        .section-header h2:after {
            content: '';
            position: absolute;
            width: 50%;
            height: 3px;
            background-color: #3498db;
            bottom: 0;
            left: 25%;
        }

        .section-header p {
            color: #7f8c8d;
            margin-top: 1rem;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
<jsp:include page="../components/header.jsp" />
<!-- Main Content -->
<main>
    <section class="content">
        <div class="container">
            <!-- Teacher Profile Section -->
            <div class="teacher-profile" id="teacherProfile">
                <%--                    <img src="${pageContext.request.contextPath}/assets/images/teacher-profile.jpg" alt="Samuel Taylor" class="teacher-image">--%>
                <div class="teacher-info">
                    <h3>${teacher.firstName} ${teacher.lastName}</h3>
                    <p><i class="fas fa-envelope"></i> ${teacher.email}</p>
                    <p><i class="fas fa-phone"></i> ${teacher.phone}</p>
                    <div class="teacher-intro">
                        <p>${teacher.introduction}</p>
                        <p>${teacher.additionalInfo}</p>
                    </div>
                </div>
            </div>

            <!-- Subjects Section -->
            <div class="section-header">
                <h2>Subjects I Teach</h2>
                <p>Explore the various subjects available for tutoring and classes</p>
            </div>

            <div class="subjects-container" id="subjectsContainer">
                <c:choose>
                    <c:when test="${empty subjects}">
                        <p>No subjects are currently available.</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="subject" items="${subjects}">
                            <c:if test="${subject.active}">
                                <div class="subject-card">
                                    <h3>${subject.name}</h3>
                                    <p>${subject.description}</p>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </section>
</main>

<jsp:include page="../components/footer.jsp" />

<script>
    $(document).ready(function() {
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