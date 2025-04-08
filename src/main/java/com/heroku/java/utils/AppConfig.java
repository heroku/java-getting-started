package com.heroku.java.utils;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
@EnableWebMvc
public class AppConfig implements WebMvcConfigurer {

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        registry.jsp("/public/pages/", ".jsp");
        registry.jsp("/public/components/", ".jsp");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Map the URL path /stylesheets/** to the physical location /public/stylesheets/
        registry.addResourceHandler("/stylesheets/**")
                .addResourceLocations("/public/stylesheets/");

        registry.addResourceHandler("/images/**")
                .addResourceLocations("/public/images/");

        // Keep this for any resources directly under /public/
        registry.addResourceHandler("/public/**")
                .addResourceLocations("/public/");

        registry.addResourceHandler("/components/**")
                .addResourceLocations("/public/components/");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/contact-success").setViewName("contact-success");
        registry.addViewController("/error").setViewName("error");
    }

}