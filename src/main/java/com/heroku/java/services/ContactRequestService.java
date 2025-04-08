package com.heroku.java.services;

import com.heroku.java.interfaces.IContactRequestRepository;
import com.heroku.java.models.ContactRequest;
import com.heroku.java.models.Subject;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ContactRequestService {

    private final IContactRequestRepository personRepository;

    // Create operations
    @Transactional
    public ContactRequest savePerson(ContactRequest person) {
        return personRepository.save(person);
    }

    @Transactional
    public List<ContactRequest> saveAllPersons(List<ContactRequest> persons) {
        return personRepository.saveAll(persons);
    }

    // Read operations
    public Iterable<ContactRequest> findAllUnsentRequests() {
        ContactRequest probe = new ContactRequest();
        probe.setRead(false);

        Example<ContactRequest> example = Example.of(probe);
        return personRepository.findAll(example);
    }

    public Optional<ContactRequest> findPersonById(Long id) {
        return personRepository.findById(id);
    }

    public List<ContactRequest> findPersonsByLastName(String lastName) {
        return personRepository.findByLastName(lastName);
    }

    // Update operations
    @Transactional
    public ContactRequest updatePerson(ContactRequest person) {
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