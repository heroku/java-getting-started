package com.heroku.java.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Table(name = "page_visits")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageVisit {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ip_address")
    private String ipAddress;

    @Column(name = "user_agent", length = 512)
    private String userAgent;

    @Column(name = "request_uri")
    private String requestUri;

    @Column(name = "query_string", length = 1024)
    private String queryString;

    @Column(name = "session_id")
    private String sessionId;

    @Column(name = "local_address")
    private String localAddress;

    @Column(name = "visit_timestamp")
    private LocalDateTime timestamp;
}