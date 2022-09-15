package com.daniel.bugTracker.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	
	Optional<User> findByEmail(String email);
	
    List<User> findAll();
    
    List<User> findAllByProjects(Project project);
    List<User> findByProjectsNotContains(Project project);
}