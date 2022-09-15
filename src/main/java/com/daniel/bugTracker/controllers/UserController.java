package com.daniel.bugTracker.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

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

import com.daniel.bugTracker.models.User;
import com.daniel.bugTracker.models.LoginUser;
import com.daniel.bugTracker.services.UserService;

@Controller
public class UserController {
    
     @Autowired
     private UserService userServ;
    
    @GetMapping("/")
    public String index(Model model, HttpSession session) {
		    	if(session.getAttribute("userId")!=null) {
				return "redirect:/home";
			}
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "log.jsp";
    }
    
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        
    	userServ.register(newUser, result);
        
        if(result.hasErrors()) {
            // check validation
            model.addAttribute("newLogin", new LoginUser());
            return "log.jsp";
        }
        
        // No errors!  Store Id in session
        session.setAttribute("userId", newUser.getId()); 
        session.setAttribute("userName", newUser.getUserName());
        return "redirect:/home";
    }
    
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
        
        // Add once service is implemented:
         User user = userServ.login(newLogin, result);
//    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "log.jsp";
        }

//        // No errors! 
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());
    
        return "redirect:/home";
    }
   
    
    @GetMapping("/logout") 
    	public String logout(HttpSession session) {
    		session.invalidate();
    		 return "redirect:/";
    	
    } 
    
    @GetMapping("/profile") 
	public String account(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	User user = userServ.findUser(userId);
//    	User user = userServ.findUser("userId");
    	model.addAttribute("user", user);
		 return "profile.jsp";
	
    }
    
    @PutMapping(value="/profile/{id}/edit")
    public String update(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
    	if(result.hasErrors()) {
    		System.out.print(result);
    		return "profile.jsp";
    	}
    	else {
    		userServ.updateUser(user);
//            session.setAttribute("userId", user.getId()); 
//            session.setAttribute("userName", user.getUserName());
    		return "redirect:/projects";
    	}
    }
}