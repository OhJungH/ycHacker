package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.UserJoinCommand;
import com.ych.pjt.dao.UserDao;
import com.ych.pjt.util.Constant;

@Controller
public class UserController {
	private IYchCommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder=passwordEncoder;
		Constant.passwordEncoder=passwordEncoder;
	}
	private UserDao uDao;
	@Autowired
	public void setuDao(UserDao uDao) {
		this.uDao=uDao;
		Constant.uDao=uDao;
	}
	
	@RequestMapping("/join")
	@ResponseBody
	public String join (HttpServletRequest req, HttpServletResponse res, Model model) {
		System.out.println("join request");
		com = new UserJoinCommand();
		com.execute(req, model);
		
		String result = (String)req.getAttribute("result");
		if(result.equals("success")) {
			return "join-success";
		}else {
			return "join-failed";
		}
	}
	/*
	@RequestMapping("/jusoPopup")
	public String jusoPopup(HttpServletRequest req, Model model) {
		System.out.println("jusoPopup request");
		return "jusoPopup";
	}*/
}