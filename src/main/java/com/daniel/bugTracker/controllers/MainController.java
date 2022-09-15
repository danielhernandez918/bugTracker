package com.daniel.bugTracker.controllers;

import org.springframework.stereotype.Controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

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

import com.daniel.bugTracker.services.UserService;
import com.daniel.bugTracker.models.User;


@Controller
public class MainController {
	@Autowired
	UserService userService;
	
    @GetMapping("/home")
    public String home(){
        return "home.jsp";
    }
    
    @GetMapping("/manageRole")
    public String roles (){
        return "manageRole.jsp";
    }
    
//    @GetMapping("/manageUsers")
//    public String users(){
//        return "manageUsers.jsp";
//    }
    
    @RequestMapping("/manageUsers")
    public String users(Model model, HttpSession session) {
//    	if(session.getAttribute("userId")==null) {
//    		return "redirect:/";
//    	}
        List<User> users = userService.allUsers();
        model.addAttribute("users", users);
		return "manageUsers.jsp";
    }
    
//    @GetMapping("/projects")
//    public String projects(){
//        return "projects.jsp";
//    }
    
//    @GetMapping("/tickets")
//    public String tickets(){
//        return "tickets.jsp";
//    }
    
    
}

