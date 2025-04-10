<jsp:useBean id="testimonials" scope="request" type="java.util.ArrayList<com.heroku.java.dto.TestimonialDTO>"/>
<%@ page import="java.io.Serializable" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <jsp:include page="../components/headElements.jsp" />
  <title>Student Testimonials</title>
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

    /* Testimonials Grid */
    .testimonials-wrapper {
      display: flex;
      flex-wrap: wrap;
      gap: 2rem;
      justify-content: center;
      margin-top: 3rem;
    }

    /* Testimonial Card Styles */
    .testimonial-card {
      background: white;
      border-radius: 15px;
      box-shadow: var(--card-shadow);
      transition: all 0.3s var(--animation-timing);
      overflow: hidden;
      width: calc(33.333% - 2rem);
      margin-bottom: 2rem;
    }

    .testimonial-card:hover {
      transform: translateY(-10px);
      box-shadow: var(--hover-shadow);
    }

    .testimonial-card-inner {
      padding: 2rem;
    }

    .testimonial-quote {
      font-size: 1.1rem;
      color: var(--dark);
      margin-bottom: 1.5rem;
      font-style: italic;
      position: relative;
    }


    .testimonial-quote::before {
      content: '"';
      font-size: 3rem;
      color: var(--primary-light);
      opacity: 0.2;
      position: absolute;
      top: -1rem;
      left: -1rem;
    }

    .testimonial-author {
      display: flex;
      align-items: center;
      margin-top: 1.5rem;
    }

    .author-avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 1rem;
      border: 3px solid var(--light-bg);
    }

    .author-info h4 {
      font-size: 1.1rem;
      color: var(--primary-dark);
      margin-bottom: 0.2rem;
    }

    .author-info p {
      font-size: 0.9rem;
      color: var(--gray);
    }

    .testimonial-rating {
      color: #ffc107;
      margin-bottom: 1rem;
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

    /* Responsive styles */
    @media (max-width: 992px) {
      .testimonial-card {
        width: calc(50% - 2rem);
      }
    }

    @media (max-width: 768px) {
      .testimonial-card {
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
      <h1>Student Testimonials</h1>
      <p>Hear from our students and alumni about their experiences and successes with our programs.</p>
    </div>
  </div>

  <!-- Testimonials Section -->
  <div class="section-header" data-aos="fade-up">
    <h2>Student Voices</h2>
    <p>Discover how our programs have helped shape careers and transform lives</p>
  </div>

  <%-- Initialize pagination parameters --%>
  <c:set var="itemsPerPage" value="6" />
  <c:set var="currentPage" value="${param.page != null ? param.page : 1}" />
  <c:set var="totalItems" value="${fn:length(testimonials)}" />
  <c:set var="totalPages" value="${Math.ceil(totalItems / itemsPerPage)}" />
  <c:set var="startIndex" value="${(currentPage - 1) * itemsPerPage}" />
  <c:set var="endIndex" value="${Math.min(startIndex + itemsPerPage - 1, totalItems - 1)}" />

  <div class="testimonials-wrapper">
    <%-- Display testimonials for current page --%>
    <c:forEach var="testimonial" items="${testimonials}" begin="${startIndex}" end="${endIndex}" varStatus="status">
      <c:set var="testimonial" value="${testimonial}"/>
      <jsp:include page="../components/testimonial.jsp">
        <jsp:param name="lastName" value="${testimonial.lastName}"/>
        <jsp:param name="rating" value="${testimonial.rating}"/>
        <jsp:param name="date" value="${testimonial.date}"/>
        <jsp:param name="firstName" value="${testimonial.firstName}"/>
        <jsp:param name="subjectName" value="${testimonial.subject.name}"/>
        <jsp:param name="quote" value="${testimonial.testimonial}"/>
        <jsp:param name="subjectId" value="${testimonial.subject.id}"/>
      </jsp:include></>
    </c:forEach>

    <%-- If no testimonials available, show fallback content --%>
    <c:if test="${empty testimonials}">
      <div class="no-results">
        <h3>No testimonials available at the moment.</h3>
        <p>Please check back later for updates from our students.</p>
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