// Wait for DOM to be fully loaded before running any JavaScript
document.addEventListener('DOMContentLoaded', function() {
  // Simple JavaScript for header scroll effect
  window.addEventListener('scroll', function() {
    const header = document.querySelector('header');
    if (header) {
      header.classList.toggle('scrolled', window.scrollY > 0);
    }
  });

  // Mobile menu toggle (simplified)
  const menuToggle = document.querySelector('.menu-toggle');
  if (menuToggle) {
    menuToggle.addEventListener('click', function() {
      document.querySelector('.nav-links').classList.toggle('active');
    });
  }

  // Smooth scrolling for navigation links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const targetElement = document.querySelector(this.getAttribute('href'));
      if (targetElement) {
        e.preventDefault();
        targetElement.scrollIntoView({
          behavior: 'smooth'
        });
      }
    });
  });

  // Form submission with validation and nice alerts
  const contactForm = document.getElementById('contactForm');

  if (contactForm) {
    // Create a div for displaying alerts
    const alertDiv = document.createElement('div');
    alertDiv.className = 'form-alert';
    contactForm.insertBefore(alertDiv, contactForm.firstChild);

    // Add submit event listener
    contactForm.addEventListener('submit', function(event) {
      // Prevent the default form submission
      event.preventDefault();

      // Basic form validation
      const name = document.getElementById('name').value;
      const email = document.getElementById('email').value;
      const subject = document.getElementById('subject').value;
      const message = document.getElementById('message').value;

      if (!name || !email || !subject || !message) {
        alertDiv.innerHTML = `
          <div class="alert-message error">
            <i class="fas fa-exclamation-circle"></i>
            <p>Please fill out all required fields</p>
          </div>
        `;
        return;
      }

      // Get form data
      const formData = new FormData(contactForm);

      // Update button to show loading state
      const submitBtn = contactForm.querySelector('button[type="submit"]');
      const originalBtnText = submitBtn.textContent;
      submitBtn.disabled = true;
      submitBtn.textContent = 'Sending...';

      // Send the form data to the server using fetch API
      fetch('/contact', {
        method: 'POST',
        body: formData
      })
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response;
      })
      .then(data => {
        // Reset button state
        submitBtn.disabled = false;
        submitBtn.textContent = originalBtnText;

        // Show appropriate message based on response
        if (data.ok) {
          // Success response
          alertDiv.innerHTML = `
            <div class="alert-message success">
              <i class="fas fa-check-circle"></i>
              <p>Form submitted, you will be contacted shortly!</p>
            </div>
          `;

          // Reset form fields on success
          contactForm.reset();
        } else {
          // Error response
          alertDiv.innerHTML = `
            <div class="alert-message error">
              <i class="fas fa-exclamation-circle"></i>
              <p>${data.message || 'An error occurred. Please try again.'}</p>
            </div>
          `;
        }

        // Scroll to the top of the form to see the message
        alertDiv.scrollIntoView({ behavior: 'smooth', block: 'nearest' });

        // Auto-hide the message after 6 seconds
        setTimeout(() => {
          const alertMessage = alertDiv.querySelector('.alert-message');
          if (alertMessage) {
            alertMessage.style.opacity = '0';
            setTimeout(() => {
              alertDiv.innerHTML = '';
            }, 500);
          }
        }, 6000);
      })
      .catch(error => {
        console.error('Error submitting form:', error);

        // Reset button state
        submitBtn.disabled = false;
        submitBtn.textContent = originalBtnText;

        // Show error message
        alertDiv.innerHTML = `
          <div class="alert-message error">
            <i class="fas fa-exclamation-circle"></i>
            <p>Unable to send your message. Please check your internet connection and try again.</p>
          </div>
        `;
      });
    });
  }
});