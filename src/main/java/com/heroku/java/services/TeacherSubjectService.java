package com.heroku.java.services;

import com.heroku.java.interfaces.ISubjectRepository;
import com.heroku.java.interfaces.ITeacherRepository;
import com.heroku.java.interfaces.ITeacherSubjectLink;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeacherSubjectService {
    private final ITeacherSubjectLink teacherSubjectLink;
    private final ITeacherRepository teacherRepository;
    private final ISubjectRepository subjectRepository;


    public void saveTeacher(Teacher teacher) {teacherRepository.save(teacher);}

    public void deleteTeacher(Long id) {teacherRepository.deleteById(id);}

    public void deleteAllTeachers() {teacherRepository.deleteAll();}

    public Teacher findTeacherById(Long id) { return teacherRepository.getReferenceById(id); }

    public Iterable<Teacher> findAllTeachers() { return teacherRepository
            .findAll()
            .stream()
            .filter(Teacher::isActive).toList();
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

    public Subject findSubjectById(Long id) {
        return subjectRepository.findById(id).orElse(null);
    }

    public Subject findSubjectByName(String name) {
         Subject probe = new Subject();
         probe.setName(name);
         probe.setActive(true);

         Example<Subject> example = Example.of(probe);
         return subjectRepository.findOne(example).orElse(null);
    }
}
