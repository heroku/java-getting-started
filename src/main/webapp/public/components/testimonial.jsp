<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="type1" value="prerna" />

<div class="testimonial-card" data-aos="fade-up" data-rating="${param.rating}" data-subject="${param.subjectId}">
    <div class="testimonial-card-inner">
        <div class="testimonial-icon">
            <i class="fas fa-quote-left"></i>
        </div>

        <div class="testimonial-content">
            <p class="testimonial-quote">${param.quote}</p>

            <div class="testimonial-rating">
               <c:set var="numericRating" value="0"/>
                <c:catch var="ratingException">
                    <c:set var="numericRating" value="${param.rating}"/>
                </c:catch>

                <c:forEach begin="1" end="5" var="i">
                    <i class="${i <= numericRating ? 'fas' : 'far'} fa-star"></i>
                </c:forEach>
            </div>

            <div class="testimonial-author">
                <div class="author-info">
                    <h4>${param.firstName} ${param.lastName}</h4>
                </div>
            </div>

            <c:if test="${not empty param}">
                <div class="testimonial-details">
                    <div class="detail-item">
                        <i class="fas fa-book"></i>
                        <span>${param.subjectName}</span>
                    </div>
                    <c:if test="${not empty param.date}">
                        <div class="detail-item">
                            <i class="far fa-calendar-alt"></i>
                            <span>${param.date}</span>
                        </div>
                    </c:if>
                </div>
            </c:if>
        </div>
    </div>
</div>
