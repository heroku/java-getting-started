<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Header -->
<header>
  <div class="container">
    <nav>
      <div class="logo">
        <i class="fas fa-square-root-variable logo-icon"></i>
        <h1>MathCode Academy</h1>
      </div>
      <div class="nav-links">
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/subjects">Subjects</a>
        <a href="/#approach">Teaching</a>
        <a href="/#testimonials">Testimonials</a>
        <a href="/contact">Contact</a>
      </div>
      <button class="menu-toggle">
        <i class="fas fa-bars"></i>
      </button>
    </nav>
  </div>
</header>
<!-- Spacer div to ensure content doesn't get hidden under header -->
<div class="header-spacer"></div>

<style>
  header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #fff;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    z-index: 1000;
  }

  .header-spacer {
    height: 80px; /* Adjust this value to match your header's height */
    width: 100%;
  }

  body {
    padding-top: 0; /* Remove any existing body padding-top if present */
    margin-top: 0;
  }

  /* Ensure the main content starts after the header */
  main {
    margin-top: 20px; /* Additional spacing between header and content */
  }
</style>

<script>
  // Adjust spacer height if header height changes (e.g., on responsive layouts)
  document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('header');
    const spacer = document.querySelector('.header-spacer');

    function updateSpacerHeight() {
      const headerHeight = header.offsetHeight;
      spacer.style.height = headerHeight + 'px';
    }

    // Initial adjustment
    updateSpacerHeight();

    // Update on window resize
    window.addEventListener('resize', updateSpacerHeight);
  });
</script>