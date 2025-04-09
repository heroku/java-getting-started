package com.heroku.java.services;

import com.heroku.java.interfaces.IVisitTrackerRepository;
import com.heroku.java.models.PageVisit;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.Instant;

@Service
@RequiredArgsConstructor
public class VisitTrackingService {
    private final IVisitTrackerRepository trackerRepository;

    public void trackVisit(HttpServletRequest request) {
        String ipAddress = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String requestURI = request.getRequestURI();
        String queryString = request.getQueryString();
        String sessionIdentifier = request.getSession().getId();
        String localAdr = request.getLocalAddr();

        PageVisit visit = new PageVisit();
        visit.setIpAddress(ipAddress);
        visit.setLocalAddress(localAdr);
        visit.setQueryString(queryString);
        visit.setRequestUri(requestURI);
        visit.setSessionId(sessionIdentifier);
        visit.setUserAgent(userAgent);
        visit.setTimestamp(Timestamp.from(Instant.now()).toLocalDateTime());

        trackerRepository.save(visit);
    }
}
