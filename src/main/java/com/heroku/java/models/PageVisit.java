package com.heroku.java.models;

import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "page_visits", indexes = {
        @Index(name = "idx_visit_timestamp", columnList = "visit_timestamp"),
        @Index(name = "idx_session_id_request_uri", columnList = "session_id, request_uri"),
        @Index(name = "idx_http_method_request_uri", columnList = "http_method, request_uri"),
        @Index(name = "idx_ip_address_timestamp", columnList = "ip_address, visit_timestamp")
})
public class PageVisit implements Serializable {

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

    @Column(name = "http_method")
    private String httpMethod;

    @Column(name = "referer")
    private String referer;

    @Column(name = "cookies", length = 2048)
    private String cookies;

    @Column(name = "status_code")
    private Integer statusCode;

    @Column(name = "execution_time")
    private Long executionTime;

    @Column(name = "exception_message", length = 1024)
    private String exceptionMessage;

    @Column(name = "exception_stacktrace", length = 4096)
    private String exceptionStackTrace;

    @Column(name = "http_headers", length = 2048)
    private String httpHeaders;

    @Column(name = "response_size")
    private Long responseSize;

    @Column(name = "locale", length = 255)
    private String locale;

    @Column(name = "content_type", length = 255)
    private String contentType;

    @Column(name = "auth_type", length = 255)
    private String authType;

    @Column(name = "scheme", length = 50)
    private String scheme;

    @Column(name = "server_name", length = 255)
    private String serverName;

    @Column(name = "server_port")
    private Integer serverPort;

    @Column(name = "remote_host", length = 255)
    private String remoteHost;

    @Column(name = "remote_port")
    private Integer remotePort;

    @Column(name = "handler_name", length = 255)
    private String handlerName;

    @Column(name = "parameters", length = 4096)
    private String parameters;
}