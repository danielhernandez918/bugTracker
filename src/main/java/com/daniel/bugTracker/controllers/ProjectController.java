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
import org.springframework.web.bind.annotation.PutMapping;
//import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.models.User;
import com.daniel.bugTracker.services.ProjectService;
import com.daniel.bugTracker.services.UserService;

@Controller
public class ProjectController {
	 @Autowired 
	 ProjectService projectService;
	 
	 @Autowired 
	 UserService userService;
	 
    @RequestMapping("/projects")
    public String allProjects(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
        List<Project> projects = projectService.findProjectByPoster(userId);
        model.addAttribute("projects", projects);
    	List<User> users = userService.allUsers();
    	model.addAttribute("users", users);
    	User user = userService.findUser(userId);
		model.addAttribute("assignedProjects", projectService.getAssignedPartners(user));
//		model.addAttribute("unassignedprojects", projectService.getUnassignedPartners(user));
        return "projects.jsp";
    }
	 
    @GetMapping("/project/new")
	public String newProject(@ModelAttribute("project") Project project, HttpSession session){
		if(session.getAttribute("userId")==null) {
			return "redirect:/";
		}
	return "newProject.jsp";
	}
    
    @PostMapping("/project/create")
    public String projectCreate(@Valid @ModelAttribute("project") Project project, BindingResult result) {
    	if(result.hasErrors()) {
    		return "newProject.jsp";
    	}
    	else {
    		projectService.createProject(project);
    		return "redirect:/projects";
    	}
    }
    
    @GetMapping("/project/{projectId}")
    public String index(Model model, @PathVariable("projectId") Long projectId, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	Project project = projectService.findProject(projectId);
    	model.addAttribute("project", project);
    	List<User> users = userService.allUsers();
    	model.addAttribute("users", users);
		model.addAttribute("assignedUsers", userService.getAssignedProjects(project));
		model.addAttribute("unassignedUsers", userService.getUnassignedProjects(project));
    	
    	return "showProject.jsp";
    }
    
    @PostMapping("/project/{projectId}")
    public String addPartner(@PathVariable("projectId") Long projectId, @RequestParam(value="userId") Long userId,  Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	//can do findUsertoAdd through service or here
    	//projectService.findUsertoAdd(projectId, userId);
    	Project project = projectService.findProject(projectId);
    	User partner = userService.findUser(userId);
    	project.getPartners().add(partner);
    	projectService.updateProject(project);
		model.addAttribute("assignedUsers", userService.getAssignedProjects(project));
		model.addAttribute("unassignedUsers", userService.getUnassignedProjects(project));
		return "redirect:/project/" + projectId;
    	
    }
}
