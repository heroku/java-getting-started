package com.heroku.java.interfaces;

import com.heroku.java.models.ContactRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IContactRequestRepository extends JpaRepository<ContactRequest, Long> {

    // Custom query methods
    List<ContactRequest> findByLastName(String lastName);

    List<ContactRequest> findByFirstNameAndLastName(String firstName, String lastName);

    List<ContactRequest> findByEmailContaining(String emailPart);
}