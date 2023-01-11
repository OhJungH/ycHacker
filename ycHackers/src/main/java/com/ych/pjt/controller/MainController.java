package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ych.pjt.command.IYchCommand;

@Controller
public class MainController {
	private IYchCommand com;
	
	//home.jsp link
	@RequestMapping("/home")
	public String home2() {
		System.out.println("home request");
		return "home";
	}
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest request, Model model) {
		System.out.println("loginView request at home");
		return "loginView";
	}
	@RequestMapping("/infoBoardHome")
	public String infoBoard(HttpServletRequest request, Model model) {
		System.out.println("infoBoard request at home");
		return "infoBoardHome";
	}
	@RequestMapping("/joinViewHome")
	public String joinView(HttpServletRequest request, Model model) {
		System.out.println("joinView request at home");
		return "joinView";
	}

}
