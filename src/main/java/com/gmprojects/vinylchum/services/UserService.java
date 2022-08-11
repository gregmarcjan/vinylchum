package com.gmprojects.vinylchum.services;

//IMPORTS

import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import com.gmprojects.vinylchum.models.LoginUser;
import com.gmprojects.vinylchum.models.User;
import com.gmprojects.vinylchum.models.Vinyl;
import com.gmprojects.vinylchum.repositories.UserRepository;
    
@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepo;
    
    public User register(User newUser, BindingResult result) {
        
    	// A container object which may or may not contain a non-null value. 
    	// If a value is present, isPresent() will return true and get() will return the value.
    	
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	
    	if (potentialUser.isPresent()) {
    		result.rejectValue("confirm", "Matches", "That account already exists. If it's your email address, use it to log in.");
    	}
    	
    	if (!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "Matches", "The 'confirm' password is not matching the password you have entered.");
    	}
    	
    	if (result.hasErrors()) {
    		return null;
    	}
    	
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepo.save(newUser);
    	
    }
    
    public User login(LoginUser newLogin, BindingResult result) {
        
    	Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
    	
    	// Using below commented line to test in console at this stage
    	// System.out.println(newLogin.getEmail());
    	
    	if (!potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "User cannot be identified.");
    		return null;
    	}
    	
    	User user = potentialUser.get();
    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    		result.rejectValue("password", "Matches", "Invalid password.");
    	}
    	
    	if (result.hasErrors()) {
    		return null;
    	}
    	
        return user;
    }
    
    public User findByEmail(String email) {
    	Optional<User> potentialUser = userRepo.findByEmail(email);
    	if (potentialUser.isPresent()) {
    		return potentialUser.get();
    	}
    	
    	return null;
    	
    }
    
    public User findById(Long id) {
    	Optional<User> potentialUser = userRepo.findById(id);
    	if (potentialUser.isPresent()) {
    		return potentialUser.get();
    	}
    	
    	return null;
    	
    }
    
    public User updateUser(User user) {
		return userRepo.save(user);
    }
    
}