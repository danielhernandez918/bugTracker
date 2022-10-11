package com.daniel.bugTracker.services;

import java.util.List;
import java.util.Optional;

import javax.validation.constraints.Email;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.daniel.bugTracker.models.LoginUser;
import com.daniel.bugTracker.models.Project;
import com.daniel.bugTracker.models.User;
import com.daniel.bugTracker.repositories.UserRepository;
    
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    public User register(User newUser, BindingResult result) {

    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
//    	1. check email is taken. If present, reject
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email","unique", "The email is already exists");
    	}
//    	2. check is password matches confirm
    	if(!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("password","matches","The password and confirm password do not match");
    	}
//    	3. If result has errors
    	if(result.hasErrors()) {
    		return null;
    	}
//    	4. Hash and set password, save user to database
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepo.save(newUser);
    }
	public User login(LoginUser newLogin, BindingResult result ) {
        // TO-DO - Reject values:
        
    	// 1. Find user in the DB by email
		Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
		
        // 2. if email NOT present, reject
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "Unknown email");
			return null;
		}
		
        // 3. get user from db
		User user = potentialUser.get();
        // if BCrypt password match fails, reject
		
		if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
		    result.rejectValue("password", "Matches", "Invalid Password!");
		}

        // Return null if result has errors
		if(result.hasErrors()) {
			return null;
		}
		return user;
		
	}
	
	public List<User> allUsers() {
		return userRepo.findAll();
	}
	public User findUser(Long id) {
		
		Optional<User> user = userRepo.findById(id);
		if (user.isPresent()) {
			return user.get();
		}
		else {
			return null;
		}
	}
	
	public User updateUser(User user) {
	    return userRepo.save(user);
	}
	
    public User updatePassword(User user, BindingResult result ) {
//      1. check is password matches confirm
          if(!user.getPassword().equals(user.getConfirm())) {
              result.rejectValue("password","matches","The password and confirm password do not match");
          }
//      2. If result has errors
          if(result.hasErrors()) {
              return null;
          }
//      3. Hash and set password, save user to database
          String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
          user.setPassword(hashed);
          return userRepo.save(user);
          
      }
	
	public void deleteUser(Long id) {
		userRepo.deleteById(id);
	}
	
	public List<User> getAssignedProjects(Project project){
		return userRepo.findAllByProjects(project);
	}
	
	public List<User> getUnassignedProjects(Project project){
		return userRepo.findByProjectsNotContains(project);
	}
}