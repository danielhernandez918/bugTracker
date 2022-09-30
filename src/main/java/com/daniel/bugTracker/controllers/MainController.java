package com.daniel.bugTracker.controllers;

import org.springframework.stereotype.Controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
        User user = userService.findUser(userId);
        List<Project> assignedProjects = projectService.getAssignedPartners(user);	
        List<Ticket> allTickets = ticketService.allTickets();
        //project Id and and ticket project id need to match for partnered tickets to be added to tickets list
        for(Project project:assignedProjects) {
        	for(Ticket ticket:allTickets) {
            	if(project.getId() == ticket.getProject().getId() && !tickets.contains(ticket)) {
            		tickets.add(ticket);
            	}
        	}
        }
        Collections.sort(tickets, new Comparator<Ticket>() {
	        public int compare(Ticket o1, Ticket o2) {
	            if (o1.getPriorityNum() == o2.getPriorityNum()) {
	                return 0;
	            }
	            else if (o1.getPriorityNum() < o2.getPriorityNum()) {
	                return -1;
	            }
	            return 1;
	        }
	    });
        model.addAttribute("tickets", tickets);
        //list to compare users tickets
        List<Ticket> userTickets = new ArrayList<>(tickets);
        // can compare by userId or userName
//        Collections.sort(userTickets, new Comparator<Ticket>() {
//	        public int compare(Ticket o1, Ticket o2) {
//	            if (o1.getPoster().getId() == o2.getPoster().getId()) {
//	                return 0;
//	            }
//	            else if (o1.getPoster().getId() < o2.getPoster().getId()) {
//	                return -1;
//	            }
//	            return 1;
//	        }
//	    });
        Collections.sort(userTickets, (o1, o2) -> (o1.getPoster().getUserName().compareTo(o2.getPoster().getUserName())));
	    model.addAttribute("userTickets", userTickets);
	    //list to compare types of tickets
	    List<Ticket> typeTickets = new ArrayList<>(tickets);
	    Collections.sort(typeTickets, (o1, o2) -> (o1.getType().compareTo(o2.getType())));
	    model.addAttribute("typeTickets", typeTickets);
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

