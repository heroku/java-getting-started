package com.heroku.java.interfaces;

import com.heroku.java.models.StudentTestimonials;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import org.hibernate.annotations.Proxy;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Proxy(proxyClass = IStudentTestimonials.class)
public interface IStudentTestimonials extends CrudRepository<StudentTestimonials, Long> {
}