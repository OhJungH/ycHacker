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
	@RequestMapping("/loginView")
	public String loginView(HttpServletRequest request, Model model) {
		System.out.println("loginView request at home");
		return "loginView";
	}
	@RequestMapping("/inforBoardHome")
	public String inforBoard(HttpServletRequest request, Model model) {
		System.out.println("inforBoard request at home");
		return "inforBoardHome";
	}
	@RequestMapping("/joinViewHome")
	public String joinView(HttpServletRequest request, Model model) {
		System.out.println("joinView request at home");
		return "joinView";
	}
	
	

}
