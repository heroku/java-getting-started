<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Header -->
<header>
  <div class="container">
    <nav>
      <div class="logo">
        <i class="fas fa-square-root-variable logo-icon"></i>
        <h1>MathCode Academy</h1>
      </div>
      <div class="nav-links" id="nav-links">
        <a href="/">Home</a>
        <a href="/about">About</a>
        <a href="/subjects">Subjects</a>
        <a href="/#approach">Teaching</a>
        <a href="/#testimonials">Testimonials</a>
        <a href="/contact">Contact</a>
      </div>
      <button class="menu-toggle" id="menu-toggle" aria-label="Toggle navigation menu">
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
    height: 80px; /* Initial value, will be updated by JS */
    width: 100%;
  }

  body {
    padding-top: 0;
    margin-top: 0;
  }

  main {
    margin-top: 20px;
  }

  /* Mobile navigation styling */
  .menu-toggle {
    display: none;
    background: none;
    border: none;
    font-size: 1.5rem;
    cursor: pointer;
  }

  /* Media query for mobile devices */
  @media (max-width: 768px) {
    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 0;
    }

    .menu-toggle {
      display: block;
    }

    .nav-links {
      position: absolute;
      top: 100%; /* Position right below the header */
      left: 0;
      right: 0;
      background-color: #fff;
      box-shadow: 0 5px 10px rgba(0,0,0,0.1);
      display: flex;
      flex-direction: column;
      width: 100%;
      text-align: center;
      height: 0;
      opacity: 0;
      visibility: hidden;
      overflow: hidden;
      transition: opacity 0.3s ease, visibility 0.3s ease;
    }

    .nav-links.active {
      height: auto;
      opacity: 1;
      visibility: visible;
    }

    .nav-links a {
      padding: 15px;
      display: block;
      border-bottom: 1px solid #eee;
      opacity: 0;
      transform: translateY(-10px);
      transition: opacity 0.3s ease, transform 0.3s ease;
    }

    .nav-links.active a {
      opacity: 1;
      transform: translateY(0);
      transition-delay: 0.1s; /* Slight delay for better animation effect */
    }

    /* Stagger the animation for each link */
    .nav-links.active a:nth-child(2) { transition-delay: 0.15s; }
    .nav-links.active a:nth-child(3) { transition-delay: 0.2s; }
    .nav-links.active a:nth-child(4) { transition-delay: 0.25s; }
    .nav-links.active a:nth-child(5) { transition-delay: 0.3s; }
    .nav-links.active a:nth-child(6) { transition-delay: 0.35s; }
  }
</style>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('header');
    const spacer = document.querySelector('.header-spacer');
    const menuToggle = document.getElementById('menu-toggle');
    const navLinks = document.getElementById('nav-links');
    let isMenuOpen = false;

    // Function to update the spacer height
    function updateLayout() {
      const headerHeight = header.offsetHeight;
      spacer.style.height = headerHeight + 'px';

      // Properly position the mobile nav
      if (window.innerWidth <= 768) {
        // When menu is positioned at top: 100%, we don't need to adjust its top position
        // as it will automatically be positioned below the header
      }
    }

    // Toggle menu on mobile
    menuToggle.addEventListener('click', function(e) {
      e.stopPropagation(); // Prevent the click from bubbling to document
      isMenuOpen = !isMenuOpen;
      navLinks.classList.toggle('active', isMenuOpen);
      // Update aria attributes for accessibility
      menuToggle.setAttribute('aria-expanded', isMenuOpen);
    });

    // Close menu when a link is clicked
    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', function() {
        if (window.innerWidth <= 768) {
          isMenuOpen = false;
          navLinks.classList.remove('active');
          menuToggle.setAttribute('aria-expanded', 'false');
        }
      });
    });

    // Close menu when clicking outside
    document.addEventListener('click', function(e) {
      if (isMenuOpen && !navLinks.contains(e.target) && e.target !== menuToggle) {
        isMenuOpen = false;
        navLinks.classList.remove('active');
        menuToggle.setAttribute('aria-expanded', 'false');
      }
    });

    // Stop propagation from nav-links to prevent closing when clicking inside
    navLinks.addEventListener('click', function(e) {
      e.stopPropagation();
    });

    // Initial adjustment
    updateLayout();
    menuToggle.setAttribute('aria-expanded', 'false');

    // Update on window resize
    window.addEventListener('resize', function() {
      updateLayout();
      // Reset mobile menu state on larger screens
      if (window.innerWidth > 768 && isMenuOpen) {
        isMenuOpen = false;
        navLinks.classList.remove('active');
        menuToggle.setAttribute('aria-expanded', 'false');
      }
    });
  });
</script>