package com.heroku.java.services;

import com.heroku.java.interfaces.IVisitTrackerRepository;
import com.heroku.java.models.PageVisit;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.Instant;

@Service
@RequiredArgsConstructor
public class VisitTrackingService {
    private final IVisitTrackerRepository trackerRepository;

    public void trackVisit(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        String ipAddress = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String requestURI = request.getRequestURI();
        String queryString = request.getQueryString();
        String sessionIdentifier = request.getSession().getId();
        String localAdr = request.getLocalAddr();
        String method = request.getMethod();
        String referer = request.getHeader("Referer");
        String cookies = request.getHeader("Cookie");
        String handlerName = (handler != null) ? handler.toString() : null;
        String exceptionMessage = (ex != null) ? ex.getMessage() : null;
        String exceptionStackTrace = (ex != null) ? ex.toString() : null;
        int statusCode = response.getStatus();

        PageVisit visit = new PageVisit();
        visit.setIpAddress(ipAddress);
        visit.setLocalAddress(localAdr);
        visit.setQueryString(queryString);
        visit.setRequestUri(requestURI);
        visit.setSessionId(sessionIdentifier);
        visit.setUserAgent(userAgent);
        visit.setTimestamp(Timestamp.from(Instant.now()).toLocalDateTime());
        visit.setReferer(referer);
        visit.setCookies(cookies);
        visit.setHttpMethod(method);
        visit.setHandlerName(handlerName);
        //visit.setExceptionMessage(exceptionMessage);
        //visit.setExceptionStackTrace(exceptionStackTrace);
        visit.setStatusCode(statusCode);

        trackerRepository.save(visit);
    }
}
