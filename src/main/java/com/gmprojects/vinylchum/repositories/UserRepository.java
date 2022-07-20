package com.gmprojects.vinylchum.repositories;

//IMPORTS

import java.util.List;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.gmprojects.vinylchum.models.User;

// Repository extends CRUD

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    
    Optional<User> findByEmail(String email);
    List<User> findAll();
    
}