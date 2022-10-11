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
import java.util.stream.Collectors;

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
    	
    	//gets all tickets of logged in user
        List<Ticket> tickets = ticketService.findTicketByPoster(userId);
        
        //seperate open and closed tickets of logged in user
        List<Ticket> openTickets = new ArrayList<>();
        for(Ticket ticket:tickets) {
            if(ticket.getStatus().equals("Open")) {
                openTickets.add(ticket);
            }
        }
        List<Ticket> closeTickets = new ArrayList<>();
        for(Ticket ticket:tickets) {
            if(ticket.getStatus().equals("Close")) {
                closeTickets.add(ticket);
            }
        }
        
        //get tickets from other users part of team projects
        User user = userService.findUser(userId);
        List<Project> assignedProjects = projectService.getAssignedPartners(user);	
        List<Ticket> allTickets = ticketService.allTickets();
        //project Id and and ticket project id need to match for partnered tickets to be added to tickets list and status be open
        for(Project project:assignedProjects) {
        	for(Ticket ticket:allTickets) {
            	if(project.getId() == ticket.getProject().getId() && !openTickets.contains(ticket) && ticket.getStatus().equals("Open")) {
            		openTickets.add(ticket);
            	}
        	}
        }
        
        //sort by priority
        Collections.sort(openTickets, new Comparator<Ticket>() {
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
        List<Ticket> openTicketsCap = openTickets.stream().limit(7).collect(Collectors.toList());
        model.addAttribute("tickets", openTicketsCap);
        
        //add closed tickets from partners
        for(Project project:assignedProjects) {
            for(Ticket ticket:allTickets) {
                if(project.getId() == ticket.getProject().getId() && !closeTickets.contains(ticket) && ticket.getStatus().equals("Close")) {
                    closeTickets.add(ticket);
                }
            }
        }
        
        //find way to compare updated dates for closed box
//        Collections.sort(closeTickets, new Comparator<Ticket>() {
//            public  compare(Ticket o1, Ticket o2) {
//                if (o1.getUpdatedAt() == o2.getUpdatedAt()) {
//                    return 0;
//                }
//                else if (o1.getUpdatedAt() < o2.getUpdatedAt()) {
//                    return -1;
//                }
//                return 1;
//            }
//        });
        List<Ticket> closeTicketsCap = closeTickets.stream().limit(7).collect(Collectors.toList());
        model.addAttribute("closeTickets", closeTicketsCap);
        
        //list to compare users tickets
        List<Ticket> userTickets = new ArrayList<>(openTickets);
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
        List<Ticket> userTicketsCap = userTickets.stream().limit(7).collect(Collectors.toList());
	    model.addAttribute("userTickets", userTicketsCap);
	    
	    //list to compare types of tickets
	    List<Ticket> typeTickets = new ArrayList<>(openTickets);
	    Collections.sort(typeTickets, (o1, o2) -> (o1.getType().compareTo(o2.getType())));
	    List<Ticket> typeTicketsCap = typeTickets.stream().limit(7).collect(Collectors.toList());
	    model.addAttribute("typeTickets", typeTicketsCap);
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

