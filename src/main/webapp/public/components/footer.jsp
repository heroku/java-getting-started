<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Footer Spacer to ensure space above footer -->
<div class="footer-spacer"></div>
<!-- Footer -->
<footer class="site-footer">
  <div class="container">
    <div class="footer-content">
      <div class="social-links">
        <a href="${not empty socialLinks ? socialLinks.facebook : '#'}"><i class="fab fa-facebook-f"></i></a>
        <a href="${not empty socialLinks ? socialLinks.twitter : '#'}"><i class="fab fa-twitter"></i></a>
        <a href="${not empty socialLinks ? socialLinks.linkedin : '#'}"><i class="fab fa-linkedin-in"></i></a>
        <a href="${not empty socialLinks ? socialLinks.youtube : '#'}"><i class="fab fa-youtube"></i></a>
      </div>
    </div>
    <p>&copy; <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy" /> Tech Learning Hub. All rights reserved.</p>
  </div>
</footer>

<style>
  html, body {
    height: 100%;
    margin: 0;
    padding: 0;
  }

  body {
    display: flex;
    flex-direction: column;
    min-height: 100vh; /* Use viewport height to ensure full page height */
  }

  main {
    flex: 1 0 auto; /* This makes the main content expand to fill available space */
  }

  .footer-spacer {
    height: 60px; /* Adjust this value for desired spacing above footer */
    width: 100%;
  }

  .site-footer {
    flex-shrink: 0; /* Prevents the footer from shrinking */
    background-color: #2c3e50; /* Example background color */
    color: #fff;
    padding: 30px 0;
    width: 100%;
    margin-top: auto; /* Pushes footer to bottom if content doesn't fill page */
  }

  /* Ensure container styles */
  .site-footer .container {
    width: 90%;
    max-width: 1200px;
    margin: 0 auto;
  }

  /* Footer content styling */
  .footer-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
  }

  .social-links {
    display: flex;
    gap: 20px;
    margin-top: 15px;
  }

  .social-links a {
    color: #fff;
    font-size: 1.2rem;
    transition: color 0.3s ease;
  }

  .social-links a:hover {
    color: #3498db;
  }
</style>

<script>
  // Ensure footer is always at the bottom even with minimal content
  document.addEventListener('DOMContentLoaded', function() {
    function adjustFooterPosition() {
      const contentHeight = document.body.scrollHeight;
      const viewportHeight = window.innerHeight;

      // If content is less than viewport, make footer stick to bottom
      if (contentHeight < viewportHeight) {
        document.body.style.height = "100vh";
      } else {
        document.body.style.height = "auto";
      }
    }

    // Run on load and resize
    adjustFooterPosition();
    window.addEventListener('resize', adjustFooterPosition);
  });
</script>