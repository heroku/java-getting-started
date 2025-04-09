<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Teaching Approach -->
<section class="approach" id="approach">
  <div class="container">
    <div class="section-header">
      <h2>Our Teaching Approaches</h2>
      <p>How we help students achieve success in their chosen field</p>
    </div>
    <div class="approach-grid">
      <c:if test="${not empty approaches}">
        <c:forEach var="approach" items="${approaches}">
          <div class="approach-card">
            <div class="approach-icon">
              <i class="${approach.iconClass}"></i>
            </div>
            <h3>${approach.title}</h3>
            <p>${approach.description}</p>
          </div>
        </c:forEach>
      </c:if>

      <!-- Fallback static content if no approaches are provided -->
      <c:if test="${empty approaches}">
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-user"></i>
          </div>
          <h3>Personalized Learning</h3>
          <p>Instruction tailored to your specific needs, learning style, and pace for maximum effectiveness.</p>
        </div>
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-project-diagram"></i>
          </div>
          <h3>Conceptual Understanding</h3>
          <p>Focus on building strong foundations and deep understanding rather than just memorizing formulas.</p>
        </div>
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-hands-helping"></i>
          </div>
          <h3>Practical Application</h3>
          <p>Learn how to apply concepts to real-world problems and projects that demonstrate skills.</p>
        </div>
        <div class="approach-card">
          <div class="approach-icon">
            <i class="fas fa-check-circle"></i>
          </div>
          <h3>Continuous Feedback</h3>
          <p>Regular assessments and feedback to track progress and adjust teaching strategies as needed.</p>
        </div>
      </c:if>
    </div>
  </div>
</section>