package com.daniel.bugTracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

//import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.models.Ticket;
import com.daniel.bugTracker.models.User;

@Repository
public interface TicketRepository extends CrudRepository<Ticket, Long> {
    // this method retrieves all the projects from the database
    List<Ticket> findAll();
    // this method finds projects with descriptions containing the search string
    List<Ticket> findByDescriptionContaining(String search);
    // this method counts how many titles contain a certain string
    Long countByProjectContaining(String search);
    // this method deletes a project that starts with a specific title
    Long deleteByProjectStartingWith(String search);
    
//    List<Ticket> findAllByUserOrderByCreatedDateDesc(User user);
//
    List<Ticket> deleteByPoster(User user);
    
    List<Ticket> findByPoster(User user);
}
