<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../components/headElements.jsp" />
    <title>About Me - Teacher Profile</title>
</head>
<body>
     <!-- Include Header -->
    <jsp:include page="../components/header.jsp" />

    <!-- Main Content -->
    <main>
        <!-- About Section -->
        <section class="about" id="about">
            <div class="container">
                <div class="about-content">
                    <div class="about-image">
                        <img src="https://images.unsplash.com/photo-1509062522246-3755977927d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80" alt="Teacher helping student">
                    </div>
                    <div class="about-text">
                        <div class="section-title">
                            <h2>About Me</h2>
                        </div>
                        <p>With over 9 years of teaching experience in mathematics and computer science, I'm dedicated to helping students develop strong foundations and practical skills they can use in the real world.</p>
                        <p>My teaching philosophy combines clear explanations of complex concepts with hands-on practice and real-world applications. I believe every student can excel with the right guidance and support.</p>
                        <p>Whether you're struggling with basic concepts, looking to advance your skills, or preparing for exams, I provide personalized instruction tailored to your learning style and goals.</p>
                        <a href="#contact" class="btn" style="margin-top: 20px;">Get in Touch</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Skills Section -->
        <section class="skills" id="skills">
            <div class="container">
                <div class="section-title">
                    <h2>My Expertise</h2>
                </div>
                <div class="skills-container">
                    <div class="skill-card">
                        <i class="fas fa-square-root-alt"></i>
                        <h3>Mathematics</h3>
                        <p>Algebra, Calculus, Statistics, Geometry, and Trigonometry for all levels.</p>
                    </div>
                    <div class="skill-card">
                        <i class="fas fa-laptop-code"></i>
                        <h3>Computer Science</h3>
                        <p>Programming fundamentals, algorithms, data structures, and web development.</p>
                    </div>
                    <div class="skill-card">
                        <i class="fas fa-graduation-cap"></i>
                        <h3>Exam Preparation</h3>
                        <p>SAT, ACT, AP exams, and college entrance preparation.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

     <jsp:include page="../components/footer.jsp" />
    <!-- Script for smooth scrolling -->
    <script>
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function(e) {
                e.preventDefault();

                const targetId = this.getAttribute('href');
                const targetElement = document.querySelector(targetId);

                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop - 80,
                        behavior: 'smooth'
                    });
                }
            });
        });

        // Header scroll effect
        window.addEventListener('scroll', function() {
            const header = document.querySelector('header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
    </script>
</body>
</html>