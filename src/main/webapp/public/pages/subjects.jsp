<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../components/headElements.jsp" />
    <title>Academy Faculty & Curriculum</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <style>
        :root {
            --primary: #4361ee;
            --primary-light: #4895ef;
            --primary-dark: #3f37c9;
            --secondary: #f72585;
            --dark: #1b263b;
            --light: #f8f9fa;
            --gray: #6c757d;
            --success: #4cc9f0;
            --light-bg: #f5f7ff;
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            --hover-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            --animation-timing: cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f5f7ff 0%, #ffffff 100%);
            color: var(--dark);
            line-height: 1.7;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 2rem;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, var(--primary-dark) 0%, var(--primary) 100%);
            color: white;
            padding: 5rem 2rem;
            border-radius: 20px;
            margin-bottom: 4rem;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.1);
            transform: rotate(30deg);
            pointer-events: none;
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1rem;
            font-weight: 700;
            letter-spacing: -1px;
        }

        .hero p {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-bottom: 2rem;
        }

        /* Section Headers */
        .section-header {
            text-align: center;
            margin: 5rem 0 3rem;
            position: relative;
        }

        .section-header::before {
            content: '';
            position: absolute;
            width: 50px;
            height: 50px;
            background: var(--secondary);
            opacity: 0.1;
            border-radius: 50%;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: -1;
        }

        .section-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary-dark);
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .section-header h2::after {
            content: '';
            position: absolute;
            width: 70px;
            height: 4px;
            background: var(--secondary);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        .section-header p {
            color: var(--gray);
            font-size: 1.2rem;
            max-width: 700px;
            margin: 1rem auto 0;
        }

        /* Teacher Cards */
        .teachers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2.5rem;
            margin-top: 3rem;
        }

        .teacher-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: all 0.4s var(--animation-timing);
            position: relative;
            height: 100%;
        }

        .teacher-card:hover {
            transform: translateY(-15px);
            box-shadow: var(--hover-shadow);
        }

        .teacher-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: var(--primary);
        }

        .teacher-image-container {
            height: 220px;
            position: relative;
            overflow: hidden;
            background: var(--light-bg);
        }

        .teacher-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .teacher-card:hover .teacher-image {
            transform: scale(1.1);
        }

        .teacher-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary-light) 0%, var(--primary) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2.5rem;
            font-weight: 600;
            position: absolute;
            bottom: -50px;
            left: 50%;
            transform: translateX(-50%);
            border: 5px solid white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .teacher-content {
            padding: 3rem 2rem 2rem;
            display: flex;
            flex-direction: column;
        }

        .teacher-name {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--dark);
            text-align: center;
        }

        .teacher-title {
            color: var(--primary);
            font-size: 1rem;
            text-align: center;
            margin-bottom: 1.5rem;
            font-weight: 500;
        }

        .teacher-details {
            margin: 1.5rem 0;
        }

        .teacher-detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            padding-bottom: 1rem;
            border-bottom: 1px dashed rgba(0, 0, 0, 0.1);
            color: var(--dark);
        }

        .teacher-detail-item:last-child {
            border-bottom: none;
            padding-bottom: 0;
            margin-bottom: 0;
        }

        .teacher-detail-item i {
            margin-right: 1rem;
            min-width: 20px;
            color: var(--primary);
            font-size: 1.2rem;
        }

        .subjects-taught {
            margin-top: auto;
            background: var(--light-bg);
            padding: 1.5rem;
            border-radius: 12px;
        }

        .subjects-taught h4 {
            color: var(--primary-dark);
            font-size: 1.2rem;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid rgba(0, 0, 0, 0.05);
        }

        .subjects-list {
            list-style: none;
        }

        .subjects-list li {
            padding: 0.7rem 0;
            position: relative;
            padding-left: 1.5rem;
            color: var(--dark);
        }

        .subjects-list li::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 8px;
            height: 8px;
            background: var(--primary-light);
            border-radius: 50%;
        }

        /* Subject Cards */
        .subjects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2.5rem;
            margin-top: 3rem;
        }

        .subject-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: all 0.4s var(--animation-timing);
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .subject-card:hover {
            transform: translateY(-15px);
            box-shadow: var(--hover-shadow);
        }

        .subject-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            padding: 2rem;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .subject-header::after {
            content: '';
            position: absolute;
            bottom: -20px;
            right: -20px;
            width: 100px;
            height: 100px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .subject-icon {
            background: rgba(255, 255, 255, 0.2);
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }

        .subject-icon i {
            font-size: 2rem;
            color: white;
        }

        .subject-name {
            font-size: 1.8rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .subject-code {
            font-size: 1rem;
            opacity: 0.8;
        }

        .subject-content {
            padding: 2rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .subject-description {
            color: var(--dark);
            line-height: 1.7;
            margin-bottom: 1.5rem;
        }

        .subject-meta {
            margin-top: auto;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            background: var(--light-bg);
            padding: 1.5rem;
            border-radius: 12px;
        }

        .subject-meta-item {
            display: flex;
            align-items: center;
            color: var(--dark);
        }

        .subject-meta-item i {
            width: 35px;
            height: 35px;
            background: rgba(67, 97, 238, 0.1);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: var(--primary);
            font-size: 1rem;
        }

        .subject-meta-label {
            font-size: 0.85rem;
            opacity: 0.7;
            display: block;
        }

        .subject-meta-value {
            font-weight: 600;
            font-size: 1rem;
        }

        .no-content-placeholder {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            text-align: center;
            box-shadow: var(--card-shadow);
            grid-column: 1 / -1;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .no-content-icon {
            width: 80px;
            height: 80px;
            background: var(--light-bg);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
            color: var(--primary);
            font-size: 2rem;
        }

        .no-content-placeholder h3 {
            color: var(--primary-dark);
            font-size: 1.8rem;
            margin-bottom: 1rem;
        }

        .no-content-placeholder p {
            color: var(--gray);
            max-width: 500px;
            margin: 0 auto;
        }

        /* Animation Classes */
        .fade-up {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.8s ease, transform 0.8s ease;
        }

        .fade-up.active {
            opacity: 1;
            transform: translateY(0);
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .hero h1 {
                font-size: 2.8rem;
            }

            .subjects-grid,
            .teachers-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .hero {
                padding: 3rem 1.5rem;
            }

            .hero h1 {
                font-size: 2.2rem;
            }

            .section-header h2 {
                font-size: 2rem;
            }

            .container {
                padding: 1.5rem;
            }
        }

        @media (max-width: 576px) {
            .subject-meta {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<jsp:include page="../components/header.jsp" />

<div class="container">
    <!-- Hero Section -->
    <div class="hero" data-aos="fade-up">
        <div class="hero-content">
            <h1>Excellence in Education</h1>
            <p>Meet our distinguished faculty and explore our comprehensive curriculum designed to inspire and challenge our students.</p>
        </div>
    </div>

    <!-- Teachers Section -->
    <div class="section-header" data-aos="fade-up">
        <h2>Our Faculty</h2>
        <p>Passionate educators dedicated to student success</p>
    </div>

    <div class="teachers-grid">
        <c:if test="${empty teachers}">
            <div class="no-content-placeholder" data-aos="fade-up">
                <div class="no-content-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <h3>Our Faculty is Growing</h3>
                <p>We're currently in the process of building our team of exceptional educators. Check back soon to meet the brilliant minds who will guide our students.</p>
            </div>
        </c:if>

        <c:forEach items="${teachers}" var="teacher" varStatus="status">
            <div class="teacher-card" data-aos="fade-up" data-aos-delay="${status.index * 100}">
                <div class="teacher-content">
                    <h3 class="teacher-name">${teacher.firstName} ${teacher.lastName}</h3>
                    <p class="teacher-title">Faculty Member</p>

                    <div class="teacher-details">
                        <c:if test="${not empty teacher.email}">
                            <div class="teacher-detail-item">
                                <i class="fas fa-envelope"></i>
                                <span>${teacher.email}</span>
                            </div>
                        </c:if>
                        <c:if test="${not empty teacher.phone}">
                            <div class="teacher-detail-item">
                                <i class="fas fa-phone-alt"></i>
                                <span>${teacher.phone}</span>
                            </div>
                        </c:if>
                    </div>

                    <div class="subjects-taught">
                        <h4>Courses Taught</h4>
                        <c:choose>
                            <c:when test="${not empty teacher.subjects}">
                                <ul class="subjects-list">
                                    <c:forEach items="${teacher.subjects}" var="subject">
                                        <li>${subject.name}</li>
                                    </c:forEach>
                                </ul>
                            </c:when>
                            <c:otherwise>
                                <p>No courses assigned yet</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Subjects Section -->
    <div class="section-header" data-aos="fade-up">
        <h2>Our Curriculum</h2>
        <p>Comprehensive courses designed to challenge and inspire</p>
    </div>

    <div class="subjects-grid">
        <c:if test="${empty subjects}">
            <div class="no-content-placeholder" data-aos="fade-up">
                <div class="no-content-icon">
                    <i class="fas fa-book"></i>
                </div>
                <h3>Curriculum Coming Soon</h3>
                <p>Our academic team is carefully crafting an innovative curriculum. Check back soon to explore the exciting courses we'll be offering.</p>
            </div>
        </c:if>

        <c:forEach items="${subjects}" var="subject" varStatus="status">
            <div class="subject-card" data-aos="fade-up" data-aos-delay="${status.index * 100}">
                <div class="subject-header">
                    <div class="subject-icon">
                        <i class="fas fa-book-open"></i>
                    </div>
                    <h3 class="subject-name">${subject.name}</h3>
                </div>
                <div class="subject-content">
                    <p class="subject-description">${subject.description}</p>

                    <div class="subject-meta">
                        <div class="subject-meta-item">
                            <i class="fas fa-users"></i>
                            <div>
                                <span class="subject-meta-label">Instructors</span>
                                <span class="subject-meta-value">${not empty subject.teachers ? subject.teachers.size() : '1'}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="../components/footer.jsp" />

<!-- AOS Animation Library -->
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Initialize AOS
        AOS.init({
            duration: 800,
            easing: 'ease-in-out',
            once: true
        });
    });
</script>
</body>
</html>