package com.gmprojects.vinylchum.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.gmprojects.vinylchum.services.VinylService;
import com.gmprojects.vinylchum.services.UserService;

@Controller 
public class HomeController {

	// Connecting my book business logic
	
	@Autowired
	private VinylService vinyls;
	
	// Connecting my user business logic
	
	@Autowired
	private UserService users;

}