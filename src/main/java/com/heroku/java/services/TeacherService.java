package com.heroku.java.services;

import com.heroku.java.interfaces.ITeacherRepository;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeacherService {
    private final ITeacherRepository teacherRepository;

    public void saveTeacher(Teacher teacher) {teacherRepository.save(teacher);}

    public void deleteTeacher(Long id) {teacherRepository.deleteById(id);}

    public void deleteAllTeachers() {teacherRepository.deleteAll();}

    public Teacher findTeacherById(Long id) {
        Teacher probe = new Teacher();
        probe.setActive(true);
        probe.setId(id);

        Example<Teacher> example = Example.of(probe);
        return teacherRepository.findOne(example).orElse(null);
    }

    public Iterable<Teacher> findAllTeachers() { return teacherRepository
            .findAll()
            .stream()
            .filter(Teacher::isActive).toList();
    }
}
