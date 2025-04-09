package com.heroku.java.interfaces;

import com.heroku.java.models.PageVisit;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Template;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IVisitTrackerRepository extends JpaRepository<PageVisit, Long> { }