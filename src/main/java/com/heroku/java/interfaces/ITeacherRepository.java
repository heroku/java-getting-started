package com.heroku.java.interfaces;

import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ITeacherRepository extends JpaRepository<Teacher, Long> { }