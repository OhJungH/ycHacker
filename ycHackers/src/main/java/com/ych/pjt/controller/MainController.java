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
	@RequestMapping("/joinViewHome")
	public String joinView(HttpServletRequest request, Model model) {
		System.out.println("joinView request at home");
		return "joinView";
	}
	@RequestMapping("/myPageView")
	public String myPageView(HttpServletRequest request, Model model) {
		System.out.println("myPageView request");
		return "myPageView";
	}
}
