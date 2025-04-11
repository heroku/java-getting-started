<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Hero Section -->
<section class="hero" id="home">
  <div class="container">
    <div class="hero-content">
      <div class="hero-text">
        <h1><span class="text-gradient">Empowering Your Journey in Learning and Education </span>The Simple Way</h1>
        <p class="lead-text">Personalized teaching that <strong>builds confidence</strong> and <em>unlocks potential</em> in your chosen subjects.</p>
        <div class="cta-wrapper">
          <a href="/contact" class="btn btn-primary pulse-effect">Schedule a Consultation</a>
          <span class="no-obligation">No obligation, free 15-minute intro call</span>
        </div>
      </div>
      <div class="hero-image">
        <div class="image-container">
          <img src="https://images.unsplash.com/photo-1581089781785-603411fa81e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80" alt="Math and Computer Science Education">
          <div class="floating-icon icon-code"><i class="fas fa-code"></i></div>
          <div class="floating-icon icon-math"><i class="fas fa-square-root-alt"></i></div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Add this in your head section to use FontAwesome icons -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"> -->

<!-- Inline CSS to add - add this to your CSS file -->
<style>

  .text-gradient {
    background: linear-gradient(90deg, #ff006e, #8E54E9);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    color: transparent;
  }

  .lead-text {
    font-size: 1.2rem;
    line-height: 1.5;
    margin-bottom: 25px;
  }

  .cta-wrapper {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
  }

  .btn-primary {
    background-color: #4361ee;
    color: white;
    border: none;
    font-weight: 600;
    letter-spacing: 0.3px;
    padding: 12px 24px;
    transition: transform 0.3s, box-shadow 0.3s;
  }

  .btn-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
  }

  .pulse-effect {
    animation: pulse 2s infinite;
  }

  @keyframes pulse {
    0% {
      box-shadow: 0 0 0 0 rgba(67, 97, 238, 0.4);
    }
    70% {
      box-shadow: 0 0 0 10px rgba(67, 97, 238, 0);
    }
    100% {
      box-shadow: 0 0 0 0 rgba(67, 97, 238, 0);
    }
  }

  .no-obligation {
    font-size: 13px;
    margin-top: 10px;
    opacity: 0.7;
  }

  .image-container {
    position: relative;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
  }

  .image-container:hover {
    transform: translateY(-5px);
  }

  .floating-icon {
    position: absolute;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: white;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    font-size: 20px;
  }

  .icon-code {
    top: 15%;
    left: -25px;
    color: #4361ee;
  }

  .icon-math {
    bottom: 20%;
    right: -25px;
    color: #8E54E9;
  }
</style>