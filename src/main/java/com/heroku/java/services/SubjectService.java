package com.heroku.java.services;

import com.heroku.java.dto.SubjectDTO;
import com.heroku.java.interfaces.ISubjectRepository;
import com.heroku.java.interfaces.ITeacherRepository;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import io.lettuce.core.api.sync.RedisCommands;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

@Service
@RequiredArgsConstructor
public class SubjectService {
    private final ISubjectRepository subjectRepository;
    private final ITeacherRepository teacherRepository;
    private final RedisCommands<String, SubjectDTO> oneCommand;
    private final RedisCommands<String, List<SubjectDTO>> twoCommand;

    public void saveSubject(Subject subject) {
        subjectRepository.save(subject);
    }

    public void deleteSubject(Long id) {
        subjectRepository.deleteById(id);
    }

    public void deleteAllSubjects() {
        subjectRepository.deleteAll();
    }

    public Iterable<SubjectDTO> findAllSubjectDTOs() {
        List<SubjectDTO> list = twoCommand.get("findAllSubjectDTOs");
        if (list != null) {
            return list;
        }


         List<SubjectDTO> dtos = subjectRepository.findAll()
                 .parallelStream()
                 .map(this::convertSubjectoSubjectDTO)
                 .toList();
        twoCommand.set("findAllSubjectDTOs", dtos);
        return dtos;
    }

    public Subject findSubjectById(Long id) {
        return subjectRepository.findById(id).orElse(null);
    }

    public Subject findSubjectByName(String name) {
           Subject probe = new Subject();
        probe.setName(name);
        probe.setActive(true);

        Example<Subject> example = Example.of(probe);
        Subject s = subjectRepository.findOne(example).orElse(null);

        return s;
    }

    public SubjectDTO findSubjectDTOByName(String name) {
        SubjectDTO subject = oneCommand.get(name + "DTO");
        if(subject != null) {
            return subject;
        }

        Subject probe = new Subject();
        probe.setName(name);
        probe.setActive(true);

        Example<Subject> example = Example.of(probe);
        Subject s = subjectRepository.findOne(example).orElse(null);
        if(s != null) {
         SubjectDTO subjectDTO = convertSubjectoSubjectDTO(s);
         oneCommand.set(name + "DTO", subjectDTO);
         return subjectDTO;
        }

        return null;
    }


    private SubjectDTO convertSubjectoSubjectDTO(Subject subject) {
        SubjectDTO dto = new SubjectDTO();
        dto.setId(subject.getId());
        dto.setName(subject.getName());
        dto.setDescription(subject.getDescription());

        List<Teacher> teachers = new CopyOnWriteArrayList<>();
        teacherRepository.findAll().parallelStream().forEach(teacher -> {
            if (teacher.isActive() &&
                    teacher.getSubjects().stream().anyMatch(s -> {
                        return s.getId().equals(subject.getId());
                    })) {
                teachers.add(teacher);
            }
        });

        dto.setTeachers(teachers);

        return dto;
    }
}
