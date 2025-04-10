package com.heroku.java.services;

import com.heroku.java.interfaces.ISubjectRepository;
import com.heroku.java.interfaces.ITeacherRepository;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TeacherSubjectService {
    private final ITeacherRepository teacherRepository;
    private final ISubjectRepository subjectRepository;


    public void saveTeacher(Teacher teacher) {teacherRepository.save(teacher);}

    public void deleteTeacher(Long id) {teacherRepository.deleteById(id);}

    public void deleteAllTeachers() {teacherRepository.deleteAll();}

    @Cacheable("subject")
    public Teacher findTeacherById(Long id) {
        Teacher probe = new Teacher();
        probe.setActive(true);
        probe.setId(id);

        Example<Teacher> example = Example.of(probe);
        return teacherRepository.findOne(example).orElse(null);
    }

    public Iterable<Teacher> findAllTeachers() {
         Teacher probe = new Teacher();
         probe.setActive(true);

         Example<Teacher> example = Example.of(probe);
         return teacherRepository.findAll(example);
    }

    public void saveSubject(Subject subject) {
        subjectRepository.save(subject);
    }

    public void deleteSubject(Long id) {
        subjectRepository.deleteById(id);
    }

    public void deleteAllSubjects() {
        subjectRepository.deleteAll();
    }

    public Iterable<Subject> findAllSubjects() {
         Subject probe = new Subject();
         probe.setActive(true);

         Example<Subject> example = Example.of(probe);
         return subjectRepository.findAll(example);
    }

    @Cacheable("subject")
    public Subject findSubjectById(Long id) {
         Subject probe = new Subject();
         probe.setId(id);
         probe.setActive(true);

         Example<Subject> example = Example.of(probe);
        return subjectRepository.findOne(example).orElse(null);
    }

    @Cacheable("subject")
    public Subject findSubjectByName(String name) {
         Subject probe = new Subject();
         probe.setName(name);
         probe.setActive(true);

         Example<Subject> example = Example.of(probe);
         return subjectRepository.findOne(example).orElse(null);
    }

//@PostConstruct
//    private void seed(){
//        Teacher teacher = new Teacher();
//        teacher.setEmail("beth.deel@sam-technology.org");
//        teacher.setFirstName("Elizabeth");
//        teacher.setLastName("Deel");
//        teacher.setPhone("(540)-793-2339");
//
//        List<Teacher> teachers = new ArrayList<>();
//        teachers.add(teacher);
//
//        Subject subject1 = new Subject();
//        subject1.setName("Music");
//        subject1.setDescription("Theory, composition, performance");
//        subject1.setTeachers(teachers);
//
//        Subject subject2 = new Subject();
//        subject2.setName("English");
//        subject2.setDescription("Vocabulary, grammar, reading, writing");
//        subject2.setTeachers(teachers);
//
//        Subject subject3 = new Subject();
//        subject3.setName("Nursing");
//        subject3.setDescription("Theory, practice, clinical skills");
//        subject3.setTeachers(teachers);
//
//        List<Subject> subjects = List.of(subject1, subject2, subject3);
//        teacher.setSubjects(subjects);
//        subjectRepository.saveAll(subjects);
//        teacherRepository.save(teacher);
//    }
}
