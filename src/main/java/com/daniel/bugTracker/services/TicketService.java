package com.daniel.bugTracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daniel.bugTracker.models.Ticket;
import com.daniel.bugTracker.repositories.TicketRepository;
import com.daniel.bugTracker.services.UserService;
import com.daniel.bugTracker.models.User;

@Service
public class TicketService {
//	private final ProjectRepository repo;
//	
//	public ProjectService(ProjectRepository repo) {
//		this.repo = repo;
//	}
	
//	Option2
	@Autowired
	private TicketRepository repo;
	
	@Autowired
	private UserService userservice;
	
	public List<Ticket> allTickets() {
		return repo.findAll();
	}
	
	public Ticket createTicket(Ticket ticket) {
		return repo.save(ticket);
	}
	
	public Ticket findTicket(Long id) {
		
		Optional<Ticket> ticket = repo.findById(id);
		if (ticket.isPresent()) {
			return ticket.get();
		}
		else {
			return null;
		}
	}
	
	public List<Ticket> findTicketByPoster(Long userid) {
		
		User user = userservice.findUser(userid);
		return repo.findByPoster(user);
	}
	
	public Ticket updateTicket(Ticket ticket) {
		
		return repo.save(ticket);
	}
	
	public void deleteTicket(Long id) {
		repo.deleteById(id);
	}
}
