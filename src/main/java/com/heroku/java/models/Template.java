package com.heroku.java.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.io.Serializable;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "templates",
        indexes = @Index(name = "idx_template_format", columnList = "template_format", unique = true))
public class Template implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(max = Integer.MAX_VALUE)
    private String templateType;

    @Lob
    @Column(name = "template_format")
    private byte[] templateFormat;
}
