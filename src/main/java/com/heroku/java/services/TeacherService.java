package com.heroku.java.services;

import com.heroku.java.dto.TeacherDTO;
import com.heroku.java.interfaces.ITeacherRepository;
import com.heroku.java.models.Subject;
import com.heroku.java.models.Teacher;
import io.lettuce.core.api.sync.RedisCommands;
import io.lettuce.core.protocol.Command;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
@RequiredArgsConstructor
public class TeacherService {
    private final ITeacherRepository teacherRepository;
    private final RedisCommands<String, TeacherDTO> oneCommand;
    private final RedisCommands<String, List<TeacherDTO>> twoCommand;

    public void saveTeacher(Teacher teacher) {teacherRepository.save(teacher);}

    public void deleteTeacher(Long id) {teacherRepository.deleteById(id);}

    public void deleteAllTeachers() {teacherRepository.deleteAll();}

    public TeacherDTO findTeacherDTOById(Long id) {
        String key = id.toString() + "DTO";
        TeacherDTO teacher = oneCommand.get(key);
        if (teacher != null) {
           return teacher;
        }

       Teacher t = teacherRepository.findById(id).orElse(null);
       if(t instanceof Teacher) {
           TeacherDTO tdo = convertTeacherToTeacherDTO(t);
           oneCommand.set(key, tdo);
           return tdo;
       }

       return null;
    }

    public Iterable<TeacherDTO> findAllTeacherDTOs() {
        List<TeacherDTO> teachers = twoCommand.get("getAllTeacherDTOs");
        if (teachers != null) {
            return teachers;
        }

        Iterable<Teacher> teacherList = teacherRepository.findAll();
        List<TeacherDTO> dtos = StreamSupport.stream(teacherList.spliterator(), true)
                .map(this::convertTeacherToTeacherDTO)
                .collect(Collectors.toList());

        twoCommand.set("getAllTeacherDTOs", dtos);

        return dtos;
    }

    private TeacherDTO convertTeacherToTeacherDTO(Teacher teacher) {
        TeacherDTO dto = new TeacherDTO();
        dto.setId(teacher.getId());
        dto.setFirstName(teacher.getFirstName());
        dto.setLastName(teacher.getLastName());
        dto.setEmail(teacher.getEmail());
        dto.setPhone(teacher.getPhone());
        dto.setSubjects(teacher.getSubjects());
        return dto;
    }
}
