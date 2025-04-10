<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="../components/headElements.jsp" />
    <!-- Add any page-specific meta tags or styles here -->
</head>
<body>
<div class="page-wrapper">
    <!-- Header -->
    <jsp:include page="../components/header.jsp" />

    <main id="main-content">
        <!-- Hero Section -->
        <section class="section-hero">
            <jsp:include page="../components/hero.jsp" />
        </section>

        <!-- Teaching Approach Section -->
        <section class="section-approach">
            <jsp:include page="../components/approach.jsp" />
        </section>
    </main>

    <!-- Footer -->
    <jsp:include page="../components/footer.jsp" />
</div>

<!-- Add any page-specific scripts here -->
</body>
</html>