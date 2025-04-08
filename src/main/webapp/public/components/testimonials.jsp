<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Testimonials Section -->
<section class="approach" id="testimonials">
  <div class="container">
    <div class="section-header">
      <h2>Student Testimonials</h2>
      <p>What my students and their parents have to say about our learning journey together</p>
    </div>
    <div class="approach-grid">
      <c:if test="${not empty testimonials}">
        <c:forEach var="testimonial" items="${testimonials}">
          <div class="approach-card">
            <div class="approach-icon">
              <i class="fas fa-quote-left"></i>
            </div>
            <h3>${testimonial.name}</h3>
            <p>${testimonial.content}</p>
          </div>
        </c:forEach>
      </c:if>

      <!-- Fallback static content if no testimonials are provided -->
      <c:if test="${empty testimonials}">
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-quote-left"></i>
          </div>
          <h3>Sarah M. - College Student</h3>
          <p>"I was struggling with Calculus II and about to drop the course when I found MathCode Academy. After just a few sessions, the concepts finally clicked. I ended up with an A- in the class!"</p>
        </div>
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-quote-left"></i>
          </div>
          <h3>David P. - High School Junior</h3>
          <p>"The programming projects we worked on were actually fun! I went from hating computer science to deciding to major in it when I go to college next year."</p>
        </div>
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-quote-left"></i>
          </div>
          <h3>Jennifer K. - Parent</h3>
          <p>"Our daughter's confidence in math has completely transformed. Her teacher noticed the improvement within weeks. The personalized approach makes all the difference."</p>
        </div>
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-quote-left"></i>
          </div>
          <h3>Michael T. - Adult Learner</h3>
          <p>"I needed to learn Python for a career change at age 40. The clear teaching style and patience helped me master the basics and land my new role in tech!"</p>
        </div>
      </c:if>
    </div>
  </div>
</section>