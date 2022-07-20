package com.gmprojects.vinylchum.controllers;

// IMPORTS

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.gmprojects.vinylchum.models.LoginUser;
import com.gmprojects.vinylchum.models.User;
import com.gmprojects.vinylchum.services.UserService;
import com.gmprojects.vinylchum.services.VinylService;

@Controller 
public class HomeController {

// Connecting my vinyl records business logic
	
@Autowired
private VinylService vinyls;
	
// Connecting my user business logic
	
@Autowired
private UserService users;
		
// HOME
		
@GetMapping("/")
public String index(Model model) {
		model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "index.jsp";
}
		
// REGISTRATION PAGE ROUTE
		
@PostMapping("/register")
public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	User user = users.register(newUser, result);
	if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
		    return "index.jsp";
	}
		    session.setAttribute("userId", user.getId());
		    return "redirect:/main";
}
		
// LOGIN PAGE ROUTE
		 
@PostMapping("/login")
public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
	User user = users.login(newLogin, result);
	if(result.hasErrors() || user==null) {
		model.addAttribute("newUser", new User());
		return "index.jsp";
	}    
		session.setAttribute("userId", user.getId());
		return "redirect:/main";
}
		 
		 // MAIN PAGE ROUTE
		    
		 @GetMapping("/main")
		 public String main (HttpSession session, Model model) {
		    if (session.getAttribute("userId") == null) {
		    	return "redirect:/";
		    }
				model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
				model.addAttribute("books", vinyls.allVinyls());
			    return "main.jsp";
		 }
	

	
}