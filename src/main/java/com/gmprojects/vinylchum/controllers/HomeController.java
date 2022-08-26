package com.gmprojects.vinylchum.controllers;

import java.util.ArrayList;

// IMPORTS

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.json.JSONArray;
import org.json.JSONObject;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.gmprojects.vinylchum.models.LoginUser;
import com.gmprojects.vinylchum.models.User;
import com.gmprojects.vinylchum.models.Vinyl;
import com.gmprojects.vinylchum.services.UserService;
import com.gmprojects.vinylchum.services.VinylService;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.io.UnsupportedEncodingException;

@Controller 
public class HomeController {

// Connecting my vinyl records business logic
	
	
@Autowired
private VinylService vinyls;
	
// Connecting my user business logic
	
@Autowired
private UserService users;

// Your API Key goes here as a String - obtain yours from discogs.com

String API_Key = "";
		
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
public String details(@PathVariable("id") Long id, Model model, HttpSession session) throws UnirestException {
	
	User user = users.findById((Long)session.getAttribute("userId"));
	model.addAttribute("user", user);
	model.addAttribute("vinyl", vinyls.findVinyl(id));
	model.addAttribute("vinyls", vinyls.allVinyls());
	
	String apiURL = "";
	Vinyl vin = vinyls.findVinyl(id);
	
//	System.out.println(id);
//	System.out.println(vin.getId());
//	System.out.println(vin.getArtist());
//	System.out.println(vin.getTitle());
//	System.out.println(vin.getYear());
//	System.out.println(vin.getLabel());
//	System.out.println(vin.getUpc_no());
//	System.out.println(vin.getCat_no());
//	System.out.println(vin.getNotes());
	
	
if (vin.getUpc_no().isEmpty() != true) {
	apiURL=String.format("https://api.discogs.com//database/search?barcode=%s&format=vinyl&format=LP&token=" + API_Key, URLEncoder.encode(vin.getUpc_no()));
	
//	System.out.println("160");
//	System.out.println(apiURL);
//	System.out.println(vin.toString());
//	System.out.println(vin.getUpc_no());
//	System.out.println(URLEncoder.encode(vin.getUpc_no()));
//	System.out.println(vin.getUpc_no().length());
} 
	else if (vin.getCat_no().isEmpty() == false) {
	apiURL=String.format("https://api.discogs.com//database/search?catno=%s&format=vinyl&format=LP&token=" + API_Key, URLEncoder.encode(vin.getCat_no()));
	
//	System.out.println("163");
//	System.out.println(vin.getCat_no());
//	System.out.println(URLEncoder.encode(vin.getCat_no()));
	
	} 
		else {
			apiURL=String.format("https://api.discogs.com//database/search?artist=%s&title=%s&format=vinyl&format=LP&token=" + API_Key, URLEncoder.encode(vin.getArtist()), URLEncoder.encode(vin.getTitle()));
			System.out.println("166");
}
	
//String apiURL="https://api.discogs.com//database/search?q=0081227957841&token=" + API_Key;
HttpResponse<com.mashape.unirest.http.JsonNode> jsonResponse=Unirest.get(apiURL).asJson();
JSONObject obj=jsonResponse.getBody().getObject();

JSONArray jArray=obj.getJSONArray("results");
ArrayList <JSONObject> results = new ArrayList <JSONObject>();

for (int i = 0; i<jArray.length(); i++) {
	results.add(jArray.getJSONObject(i));
	}

String cover_image = "";
if (results.size() == 0) {
	cover_image = "/assets/vinyl.png";
} else {
	cover_image = results.get(0).getString("cover_image");
}
model.addAttribute("cover_image", cover_image);

	return "details.jsp";
}

// DELETION ROUTE

@RequestMapping(value="/delete/{id}")
public String destroy(@PathVariable("id") Long id, HttpSession session) {
	if (session.getAttribute("userId") == null) {
		return "redirect:/";
		}
		vinyls.deleteVinyl(id);
		return "redirect:/main";

}

// SEARCH BOX ROUTE

@GetMapping("/searchbox")
public String searchbox (HttpSession session, String searchquery) {
	if (session.getAttribute("userId") == null) {
		return "redirect:/";
		}
	return "searchbox.jsp";
}

// FUTURE FEATURE -> SEARCH ROUTE

//@GetMapping("/search")
//public String search (HttpSession session, Model model) throws UnirestException {
//	if (session.getAttribute("userId") == null) {
//	return "redirect:/";
//	}
//	model.addAttribute("user", users.findById((Long)session.getAttribute("userId")));
//	model.addAttribute("vinyls", vinyls.allVinyls());
//	
//	
//	String apiURL="https://api.discogs.com//database/search?q=&token=" + API_Key;
//	String apiURL="https://api.discogs.com//database/search?q=the+dreaming&token=" + API_Key + "&artist=Kate+Bush&format=LP";
//	HttpResponse<com.mashape.unirest.http.JsonNode> jsonResponse=Unirest.get(apiURL).asJson();
//	JSONObject obj=jsonResponse.getBody().getObject();
//
//	JSONArray jArray=obj.getJSONArray("results");
//	ArrayList <JSONObject> results = new ArrayList <JSONObject>();
//
//	for (int i = 0; i<jArray.length(); i++) {
//		results.add(jArray.getJSONObject(i));
//		}
//
//	System.out.println(results.get(0).getString("title"));
//	System.out.println(results.get(0).getString("year"));
//	System.out.println(results.get(0).getString("country"));
//	System.out.println(results.get(0));
//
//		return "search.jsp";
//	}

// LOGOUT ROUTE

@GetMapping("/logout")
public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
}

}