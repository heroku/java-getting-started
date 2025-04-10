package com.heroku.java;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;


@EnableAsync
@EnableCaching
@EnableScheduling
@SpringBootApplication
public class GettingStartedApplication {
    public static void main(String[] args) {
        SpringApplication.run(GettingStartedApplication.class, args);
    }
}
