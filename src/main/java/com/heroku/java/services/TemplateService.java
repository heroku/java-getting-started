package com.heroku.java.services;

import com.heroku.java.interfaces.ITemplateRepository;
import com.heroku.java.models.Template;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TemplateService {
    private final ITemplateRepository templateRepository;

    public Template getTemplateById(long id) {
        return templateRepository.findById(id).orElse(null);
    }
}