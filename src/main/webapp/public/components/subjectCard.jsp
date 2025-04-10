<%-- subjectCard.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="subject-card" data-aos="fade-up" data-aos-delay="${param.delay}">
    <div class="subject-card-inner">
        <div class="subject-icon">
            <i class="${param.icon}"></i>
        </div>
        <div class="subject-content">
            <h3>${param.title}</h3>
            <p>${param.description}</p>
            <!-- New section to display teachers -->
            <div class="subject-teachers">
                <h4><i class="fas fa-chalkboard-teacher"></i> Instructors:</h4>
                <div class="teachers-list">
                    <c:forEach var="teacher" items="${teachers}">
                        <div class="teacher-item">
                            <span>${teacher.firstName} ${teacher.lastName}</span>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>