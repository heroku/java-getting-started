<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="../components/headElements.jsp" />
    <title>Error</title>
</head>
<body>
  <!-- Include Header -->
    <jsp:include page="../components/header.jsp" />
    <div class="container">
        <div class="error-container">
            <h1>Oops! Something went wrong</h1>
            <p>We're sorry, but the page you requested could not be found.</p>
            <a href="/" class="home-link">Return to Home</a>
        </div>
    </div>

    <jsp:include page="../components/footer.jsp" />
</body>
</html>