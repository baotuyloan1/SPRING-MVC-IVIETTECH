package com.mycompany.jv30_spring_coffee.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	
	@RequestMapping("/login")
	public String login(Model m, HttpSession session, Authentication authentication,
			@RequestParam(value = "message", required = false) String message) {

		return "login";

	}
}
