package com.heroku.java.dto;

import jakarta.persistence.Cacheable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Cacheable()
public abstract class BaseDTO { }
