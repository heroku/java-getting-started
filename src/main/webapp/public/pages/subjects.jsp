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
            --primary: #8495e8;
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
            margin: 1rem auto;
        }

        /* Subjects Section */
        .subjects-wrapper {
            display: flex;
            flex-wrap: wrap;
            gap: 2rem;
            justify-content: center;
            margin-top: 3rem;
        }

        /* Subject Card Styles */
        .subject-card {
            background: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            transition: all 0.3s var(--animation-timing);
            overflow: hidden;
            width: calc(33.333% - 2rem);
            margin-bottom: 2rem;
        }

        .subject-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--hover-shadow);
        }

        .subject-card-inner {
            padding: 2rem;
        }

        .subject-icon {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1.5rem;
            height: 60px;
            width: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--light-bg);
            border-radius: 12px;
        }

        .subject-content h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--primary-dark);
        }

        .subject-content p {
            color: var(--gray);
            margin-bottom: 1.5rem;
        }

        .subject-details {
            margin-bottom: 1.5rem;
        }

        .detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .detail-item i {
            color: var(--primary);
            margin-right: 0.5rem;
            width: 20px;
        }

        .subject-actions {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-outline {
            border: 2px solid var(--primary);
            color: var(--primary);
            background: transparent;
        }

        .btn-outline:hover {
            background: var(--primary-light);
            color: white;
            border-color: var(--primary-light);
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            border: 2px solid var(--primary);
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            border-color: var(--primary-dark);
        }

        /* Pagination Styles */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 3rem;
            gap: 0.5rem;
        }

        .pagination button {
            padding: 0.5rem 1rem;
            border: 1px solid #ddd;
            background: #fff;
            border-radius: 4px;
            cursor: pointer;
        }

        .pagination button.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
        }

        /* Responsive styles */
        @media (max-width: 992px) {
            .subject-card {
                width: calc(50% - 2rem);
            }
        }

        @media (max-width: 768px) {
            .subject-card {
                width: 100%;
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
            <h1>Excellence in STEM Education</h1>
            <p>Discover our comprehensive curriculum designed to nurture future innovators, problem-solvers, and leaders in Science, Technology, Engineering, and Mathematics.</p>
        </div>
    </div>

    <!-- Subjects Section -->
    <div class="section-header" data-aos="fade-up">
        <h2>Our Subjects</h2>
        <p>Explore our diverse range of subjects designed to cater to different levels and interests</p>
    </div>

    <%-- Initialize pagination parameters --%>
    <c:set var="itemsPerPage" value="6" />
    <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
    <c:set var="totalItems" value="${fn:length(subjects)}" />
    <c:set var="totalPages" value="${Math.ceil(totalItems / itemsPerPage)}" />
    <c:set var="startIndex" value="${(currentPage - 1) * itemsPerPage}" />
    <c:set var="endIndex" value="${Math.min(startIndex + itemsPerPage - 1, totalItems - 1)}" />

    <div class="subjects-wrapper">
        <%-- Display subjects for current page --%>
        <c:forEach var="subject" items="${subjects}" begin="${startIndex}" end="${endIndex}" varStatus="status">
            <c:set var="teachers" value="${subject.teachers}" scope="request"/>
            <jsp:include page="../components/subjectCard.jsp">
                <jsp:param name="title" value="${subject.name}" />
                <jsp:param name="description" value="${subject.description}" />
                <jsp:param name="icon" value="fas fa-book" />
            </jsp:include>
        </c:forEach>

        <%-- If no subjects available, show fallback content --%>
        <c:if test="${empty subjects}">
            <div class="no-results">
                <h3>No subjects available at the moment.</h3>
                <p>Please check back later for updates to our curriculum.</p>
            </div>
        </c:if>
    </div>

    <%-- Pagination controls --%>
    <c:if test="${totalPages > 1}">
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}" class="btn btn-outline">
                    <i class="fas fa-chevron-left"></i> Previous
                </a>
            </c:if>

            <c:forEach begin="1" end="${totalPages}" var="pageNum">
                <a href="?page=${pageNum}" class="btn ${pageNum == currentPage ? 'btn-primary' : 'btn-outline'}">
                        ${pageNum}
                </a>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}" class="btn btn-outline">
                    Next <i class="fas fa-chevron-right"></i>
                </a>
            </c:if>
        </div>
    </c:if>
</div>

<jsp:include page="../components/footer.jsp" />

<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    // Initialize AOS animation
    AOS.init({
        duration: 100,
        once: true
    });
</script>
</body>
</html>