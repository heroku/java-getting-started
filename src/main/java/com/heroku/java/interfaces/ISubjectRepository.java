package com.heroku.java.interfaces;

import com.heroku.java.models.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ISubjectRepository extends JpaRepository<Subject, Long> { }