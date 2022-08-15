package com.gmprojects.vinylchum.controllers;

import java.awt.GraphicsEnvironment;

// IMPORTS

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gmprojects.vinylchum.models.LoginUser;
import com.gmprojects.vinylchum.models.User;
import com.gmprojects.vinylchum.models.Vinyl;
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
		
// REGISTRATION PAGE ROUTES

@GetMapping("/registration")
public String register(Model model) {
		model.addAttribute("newUser", new User());
	    model.addAttribute("newLogin", new LoginUser());
	    return "register.jsp";
}

@PostMapping("/register")
public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
	User user = users.register(newUser, result);
	if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
		    return "register.jsp";
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
	model.addAttribute("vinyls", vinyls.allVinyls());
	return "main.jsp";
}

// ADD PAGE ROUTE
	 
@GetMapping("/add")
public String add(@ModelAttribute("vinyl") Vinyl vinyl, Model model, HttpSession session) {
	User user = users.findById((Long)session.getAttribute("userId"));
	model.addAttribute("user", user);	
	return "add.jsp";
}

// POST-ADDITION ROUTE

@PostMapping("/vinyls")
public String create(@Valid @ModelAttribute("vinyl") Vinyl vinyl, BindingResult result) {
	if (result.hasErrors()) {
		return "add.jsp";
    }
            vinyls.createVinyl(vinyl);
            return "redirect:/main";   
}

// EDIT ROUTE

@GetMapping("/edit/{id}")
public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
	
	User user = users.findById((Long)session.getAttribute("userId"));
	model.addAttribute("user", user);
	model.addAttribute("vinyl", vinyls.findVinyl(id));
	model.addAttribute("vinyls", vinyls.allVinyls());
	
	return "edit.jsp";
}

@PutMapping("/edit/{id}")
public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("vinyl") Vinyl vinyl, BindingResult result, Model model) {
	if (result.hasErrors()) {
		model.addAttribute("vinyls", vinyls.allVinyls());
		System.out.println(result);
		return "edit.jsp";
	}
	vinyls.updateVinyl(vinyl);
	return "redirect:/main";
}

// DETAILS ROUTE

@GetMapping("/vinyls/{id}")
public String details(@PathVariable("id") Long id, Model model, HttpSession session) {
	
	User user = users.findById((Long)session.getAttribute("userId"));
	model.addAttribute("user", user);
	model.addAttribute("vinyl", vinyls.findVinyl(id));
	model.addAttribute("vinyls", vinyls.allVinyls());
	
	return "details.jsp";
}

// DELETION ROUTE

@RequestMapping(value="/delete/{id}")
public String destroy(@PathVariable("id") Long id) {
		vinyls.deleteVinyl(id);
		return "redirect:/main";

}

// LOGOUT ROUTE

@GetMapping("/logout")
public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
}

}