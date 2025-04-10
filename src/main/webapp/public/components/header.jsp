<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Header -->
<header>
  <div class="container">
    <nav>
      <jsp:include page="./logo.jsp" />
      <button class="menu-toggle" id="menu-toggle" aria-label="Toggle navigation menu">
        <div class="hamburger">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </button>
    </nav>
  </div>
</header>
<!-- Navigation dropdown (separate from header) -->
<div class="nav-dropdown" id="nav-dropdown">
  <div class="nav-links" id="nav-links">
        <a href="/" class="nav-item"><span>Home</span></a>
        <a href="/subjects" class="nav-item"><span>Subjects</span></a>
        <a href="/#approach" class="nav-item"><span>Teaching</span></a>
        <a href="/contact" class="nav-item"><span>Contact</span></a>
        <a href="/testimonials" class="nav-item"><span>Testimonials</span></a>
  </div>
</div>

<!-- Overlay for full-screen effect -->
<div class="nav-overlay" id="nav-overlay"></div>

<!-- Spacer div to ensure content doesn't get hidden under header -->
<div class="header-spacer"></div>

<style>
  :root {
    --primary-color: #3a86ff;
    --secondary-color: #ff006e;
    --text-color: #333;
    --light-color: #ffffff;
    --dark-color: #1a1a1a;
    --transition-speed: 0.3s;
    --transition-function: cubic-bezier(0.76, 0, 0.24, 1);
    --shadow-color: rgba(0, 0, 0, 0.15);
    --header-height: min(80px, 8vw); /* Reduced from 100px to 80px and from 10vw to 8vw */
    --header-min-height: 60px; /* Minimum header height */
  }


  /* Header styling */
  header {
    position: fixed;
    top: 0;
    left: 0;
    height: max(var(--header-min-height), var(--header-height));
    width: 100%;
    background-color: var(--light-color);
    box-shadow: 0 4px 30px var(--shadow-color);
    z-index: 5000;
    transition: all var(--transition-speed) var(--transition-function);
  }

  header.scrolled {
    box-shadow: 0 8px 40px var(--shadow-color);
    transform: translateY(-5px);
  }

  .container {
    width: 90%;
    max-width: 1400px;
    margin: 0 auto;
    height: 100%;
  }

  .header-spacer {
    height: max(var(--header-min-height), var(--header-height));
    width: 100%;
  }

  main {
    margin-top: 30px;
  }

  /* Navigation styling */
  nav {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 100%; /* Use full header height */
    padding: 0;
  }

  /* Hamburger button styling */
  .menu-toggle {
    background: none;
    border: none;
    cursor: pointer;
    margin-left: auto;
    z-index: 5001;
    padding: 10px;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    outline: none;
    transition: transform 0.5s var(--transition-function);
  }

  .menu-toggle:hover {
    transform: scale(1.1);
  }

  .hamburger {
    width: min(30px, 6vw);
    height: min(20px, 4vw);
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: transform 0.5s var(--transition-function);
  }

  .hamburger span {
    width: 100%;
    height: 2px;
    background-color: var(--dark-color);
    border-radius: 2px;
    display: block;
    transition: all 0.5s var(--transition-function);
    transform-origin: center;
  }

  .menu-toggle.active .hamburger {
    transform: rotate(180deg);
  }

  .menu-toggle.active .hamburger span:nth-child(1) {
    transform: translateY(9px) rotate(45deg);
    background-color: var(--secondary-color);
  }

  .menu-toggle.active .hamburger span:nth-child(2) {
    opacity: 0;
    transform: scaleX(0);
  }

  .menu-toggle.active .hamburger span:nth-child(3) {
    transform: translateY(-9px) rotate(-45deg);
    background-color: var(--secondary-color);
  }

  /* Overlay for full-screen effect */
  .nav-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.8);
    z-index: 4999;
    opacity: 0;
    visibility: hidden;
    transition: all var(--transition-speed) var(--transition-function);
    backdrop-filter: blur(5px);
  }

  .nav-overlay.active {
    opacity: 1;
    visibility: visible;
  }

  /* Dropdown navigation for both mobile and desktop */
  .nav-dropdown {
    position: fixed;
    top: max(var(--header-min-height), var(--header-height));
    right: 0;
    width: 300px;
    background-color: var(--light-color);
    box-shadow: 0 20px 50px var(--shadow-color);
    z-index: 5000;
    opacity: 0;
    visibility: hidden;
    transform: translateY(-20px);
    transition: all 0.5s var(--transition-function);
    border-radius: 16px;
    overflow: hidden;
    max-height: calc(100vh - max(var(--header-min-height), var(--header-height)) - 40px);
    margin: 20px;
  }

  .nav-dropdown.active {
    opacity: 1;
    visibility: visible;
    transform: translateY(0);
  }

  .nav-links {
    display: flex;
    flex-direction: column;
    width: 100%;
    padding: 10px 0;
  }

  .nav-item {
    position: relative;
    text-decoration: none;
    color: var(--text-color);
    padding: 16px 25px;
    display: block;
    transition: all 0.4s var(--transition-function);
    text-align: right;
    overflow: hidden;
    font-weight: 500;
    font-size: 1.1rem;
    letter-spacing: 0.5px;
  }

  .nav-item::after {
    content: '';
    position: absolute;
    bottom: 6px;
    right: 25px;
    width: 0;
    height: 2px;
    background-color: var(--primary-color);
    transition: width 0.4s var(--transition-function);
    transform-origin: right;
  }

  .nav-item:hover {
    color: var(--primary-color);
    background-color: rgba(58, 134, 255, 0.05);
    transform: translateX(-5px);
  }

  .nav-item:hover::after {
    width: calc(100% - 50px);
  }

  .nav-item span {
    position: relative;
    z-index: 0;
  }

  /* Animations for menu items */
  .nav-dropdown.active .nav-item {
    animation: fadeInRight 0.5s var(--transition-function) forwards;
    opacity: 0;
  }

  .nav-dropdown.active .nav-item:nth-child(1) { animation-delay: 0.1s; }
  .nav-dropdown.active .nav-item:nth-child(2) { animation-delay: 0.2s; }
  .nav-dropdown.active .nav-item:nth-child(3) { animation-delay: 0.3s; }
  .nav-dropdown.active .nav-item:nth-child(4) { animation-delay: 0.4s; }
  .nav-dropdown.active .nav-item:nth-child(5) { animation-delay: 0.5s; }
  .nav-dropdown.active .nav-item:nth-child(6) { animation-delay: 0.6s; }

  @keyframes fadeInRight {
    from {
      opacity: 0;
      transform: translateX(30px);
    }
    to {
      opacity: 1;
      transform: translateX(0);
    }
  }

  /* Media query for mobile devices */
  @media (max-width: 768px) {
    :root {
      --header-height: min(70px, 12vw);
      --header-min-height: 50px;
    }

    .nav-dropdown {
      width: calc(100% - 40px);
      margin: 10px 20px;
      max-height: calc(100vh - max(var(--header-min-height), var(--header-height)) - 20px);
    }

    .nav-item {
      font-size: 1rem;
      padding: 14px 20px;
    }

    .nav-item::after {
      right: 20px;
    }

    .nav-item:hover::after {
      width: calc(100% - 40px);
    }

    .menu-toggle {
      padding: 8px;
    }
  }

  /* Extra small screens */
  @media (max-width: 480px) {
    .container {
      width: 95%;
    }

    .nav-item {
      font-size: 0.95rem;
      padding: 12px 18px;
    }
  }
</style>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('header');
    const spacer = document.querySelector('.header-spacer');
    const menuToggle = document.getElementById('menu-toggle');
    const navDropdown = document.getElementById('nav-dropdown');
    const navLinks = document.getElementById('nav-links');
    const navOverlay = document.getElementById('nav-overlay');
    let isMenuOpen = false;

    // Function to update layout dimensions
    function updateLayout() {
      // Get the computed styles to access the CSS variables
      const styles = getComputedStyle(document.documentElement);
      const minHeight = styles.getPropertyValue('--header-min-height').trim();
      const headerHeight = styles.getPropertyValue('--header-height').trim();

      // Calculate the actual height (using max of the two values)
      const actualHeight = Math.max(
              parseInt(minHeight, 10) || 60,
              parseInt(headerHeight, 10) || 100
      );

      // Update the spacer height
      spacer.style.height = actualHeight + 'px';
    }

    // Toggle menu
    menuToggle.addEventListener('click', function(e) {
      e.stopPropagation(); // Prevent the click from bubbling to document
      isMenuOpen = !isMenuOpen;
      navDropdown.classList.toggle('active', isMenuOpen);
      navOverlay.classList.toggle('active', isMenuOpen);
      menuToggle.classList.toggle('active', isMenuOpen);

      // Update aria attributes for accessibility
      menuToggle.setAttribute('aria-expanded', isMenuOpen);

      // Prevent scrolling when menu is open
      document.body.style.overflow = isMenuOpen ? 'hidden' : '';
    });

    // Close menu when a link is clicked
    navLinks.querySelectorAll('a').forEach(link => {
      link.addEventListener('click', function() {
        closeMenu();
      });
    });

    // Close menu when clicking outside or on overlay
    navOverlay.addEventListener('click', function() {
      closeMenu();
    });

    document.addEventListener('click', function(e) {
      if (isMenuOpen && !navDropdown.contains(e.target) && e.target !== menuToggle) {
        closeMenu();
      }
    });

    // Function to close menu
    function closeMenu() {
      isMenuOpen = false;
      navDropdown.classList.remove('active');
      navOverlay.classList.remove('active');
      menuToggle.classList.remove('active');
      menuToggle.setAttribute('aria-expanded', 'false');
      document.body.style.overflow = '';
    }

    // Stop propagation from nav-links to prevent closing when clicking inside
    navDropdown.addEventListener('click', function(e) {
      e.stopPropagation();
    });

    // Add scroll effect to header
    window.addEventListener('scroll', function() {
      if (window.scrollY > 50) {
        header.classList.add('scrolled');
      } else {
        header.classList.remove('scrolled');
      }
    });

    // Initial adjustment
    updateLayout();
    menuToggle.setAttribute('aria-expanded', 'false');

    // Update on window resize
    window.addEventListener('resize', function() {
      updateLayout();
    });

    // Update on window load to ensure all elements are properly sized
    window.addEventListener('load', updateLayout);

    // Handle escape key to close menu
    document.addEventListener('keydown', function(e) {
      if (e.key === 'Escape' && isMenuOpen) {
        closeMenu();
      }
    });
  });
</script>