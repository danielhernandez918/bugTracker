package com.daniel.bugTracker.controllers;

import org.springframework.stereotype.Controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daniel.bugTracker.services.ProjectService;
import com.daniel.bugTracker.services.TicketService;
import com.daniel.bugTracker.services.UserService;
import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.models.Ticket;
import com.daniel.bugTracker.models.User;


@Controller
public class MainController {
	@Autowired
	UserService userService;
	
	 @Autowired 
	 ProjectService projectService;
	
	 @Autowired 
	 TicketService ticketService;
	
    @GetMapping("/home")
    public String home(Model model, HttpSession session){
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
        return "home.jsp";
    }
    
    @GetMapping("/manageRole")
    public String roles (HttpSession session){
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
        return "manageRole.jsp";
    }
    
    
}

