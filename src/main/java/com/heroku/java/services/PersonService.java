package com.heroku.java.services;

import com.heroku.java.interfaces.IPersonRepository;
import com.heroku.java.models.Person;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PersonService {

    private final IPersonRepository personRepository;

    // Create operations
    @Transactional
    public Person savePerson(Person person) {
        return personRepository.save(person);
    }

    @Transactional
    public List<Person> saveAllPersons(List<Person> persons) {
        return personRepository.saveAll(persons);
    }

    // Read operations
    public List<Person> findAllPersons() {
        return personRepository.findAll();
    }

    public Optional<Person> findPersonById(Long id) {
        return personRepository.findById(id);
    }

    public List<Person> findPersonsByLastName(String lastName) {
        return personRepository.findByLastName(lastName);
    }

    // Update operations
    @Transactional
    public Person updatePerson(Person person) {
        if (personRepository.existsById(person.getId())) {
            return personRepository.save(person);
        }
        throw new RuntimeException("Person not found with id: " + person.getId());
    }

    // Delete operations
    @Transactional
    public void deletePerson(Long id) {
        personRepository.deleteById(id);
    }

    @Transactional
    public void deleteAllPersons() {
        personRepository.deleteAll();
    }
}