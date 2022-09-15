package com.daniel.bugTracker.services;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.repositories.ProjectRepository;
import com.daniel.bugTracker.services.UserService;
import com.daniel.bugTracker.models.User;

@Service
public class ProjectService {

	@Autowired
	private ProjectRepository repo;
	
	@Autowired
	private UserService userService;
	
	public List<Project> allProjects() {
		return repo.findAll();
	}
	
	public Project createProject(Project project) {
		return repo.save(project);
	}
	
	public Project findProject(Long id) {
		
		Optional<Project> project = repo.findById(id);
		if (project.isPresent()) {
			return project.get();
		}
		else {
			return null;
		}
	}
	
	public List<Project> findProjectByPoster(Long userid) {
		
		User user = userService.findUser(userid);
		return repo.findByPoster(user);
	}
	
	public Project updateProject(Project project) {
		
		return repo.save(project);
	}
	
	public void deleteProject(Long id) {
		repo.deleteById(id);
	}
	
	
	public Project findUsertoAdd(Long projectId, Long userId) {
		//1.get user
		User partner = userService.findUser(userId);
		//2. get project
		Project project = this.findProject(projectId);
		//3. add user to project
		project.getPartners().add(partner);
		//4. save
		return repo.save(project);
	}
	
//	public List<User> getAssignedUsers(User user){
//		return repo.findByPartners(user);
//	}
	
	public List<Project> getAssignedPartners(User user){
		return repo.findAllByPartners(user);
	}
	
	public List<Project> getUnassignedPartners(User user){
		return repo.findByPartnersNotContains(user);
	}
	
	
}
