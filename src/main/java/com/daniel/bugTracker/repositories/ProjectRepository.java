package com.daniel.bugTracker.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.models.User;

@Repository
public interface ProjectRepository extends CrudRepository<Project, Long> {

    // this method retrieves all the projects from the database
    List<Project> findAll();
    // this method finds projects with descriptions containing the search string
    List<Project> findByDescriptionContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByTitleContaining(String search);
    // this method deletes a project that starts with a specific title
    Long deleteByTitleStartingWith(String search);
    
//    List<Project> findAllByPosterOrderByCreatedDateDesc(User user);

    List<Project> deleteByPoster(User user);
    
    List<Project> findByPoster(User user);
    
//    List<User> findByPartners(User user);
    List<Project> findAllByPartners(User user);
    List<Project> findByPartnersNotContains(User user);
    
}
