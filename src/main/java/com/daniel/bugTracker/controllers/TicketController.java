package com.daniel.bugTracker.controllers;

import org.springframework.stereotype.Controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

//import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.models.Ticket;
import com.daniel.bugTracker.models.User;
import com.daniel.bugTracker.services.ProjectService;
import com.daniel.bugTracker.services.TicketService;
import com.daniel.bugTracker.services.UserService;

@Controller
public class TicketController {
	
	 @Autowired 
	 TicketService ticketService;
	 
	 @Autowired 
	 ProjectService projectService;
	 
	 @Autowired 
	 UserService userService;
	 
    @GetMapping("/ticket/new")
	public String newTicket(Model model, @ModelAttribute("ticket") Ticket ticket, HttpSession session){
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
    	Long userId = (Long) session.getAttribute("userId");
        List<Project> projects = projectService.findProjectByPoster(userId);
        model.addAttribute("projects", projects);
    	User user = userService.findUser(userId);
		model.addAttribute("assignedProjects", projectService.getAssignedPartners(user));
		
	return "newTicket.jsp";
	}
    
    @RequestMapping("/tickets")
    public String allTickets(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
        List<Ticket> tickets = ticketService.findTicketByPoster(userId);
        Collections.reverse(tickets);
        model.addAttribute("tickets", tickets);
        User user = userService.findUser(userId);
        List<Project> assignedProjects = projectService.getAssignedPartners(user);	
        List<Ticket> allTickets = ticketService.allTickets();
        List<Ticket> partneredTickets = new ArrayList();
        for(Project project:assignedProjects) {
        	for(Ticket ticket:allTickets) {
            	if(project.getId() == ticket.getProject().getId()) {
            		partneredTickets.add(ticket);
            	}
        	}
        }
        Collections.reverse(partneredTickets);
        model.addAttribute("partneredTickets", partneredTickets);
		return "tickets.jsp";
    }
    
    @PostMapping("/ticket/create")
    public String ticketCreate(@Valid @ModelAttribute("ticket") Ticket ticket, BindingResult result) {
    	if(result.hasErrors()) {
    		return "newTicket.jsp";
    	}
    	else {
    		ticketService.createTicket(ticket);
    		return "redirect:/tickets";
    	}
    }
    
    @GetMapping("/tickets/{ticketId}")
    public String index(Model model, @PathVariable("ticketId") Long ticketId, HttpSession session) {
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
		Ticket ticket = ticketService.findTicket(ticketId);
		model.addAttribute("ticket", ticket);
		
		return "showTicket.jsp";
    }
    
    @PutMapping(value="/tickets/{id}/update")
    public String update(@Valid @ModelAttribute("ticket") Ticket ticket, BindingResult result) {
    	if(result.hasErrors()) {
    		return "showTicket.jsp";
    	}
    	else {
    		ticketService.updateTicket(ticket);
    		return "redirect:/tickets";
    	}
    }
}