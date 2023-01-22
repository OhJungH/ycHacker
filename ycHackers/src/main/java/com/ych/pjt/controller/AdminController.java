package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.UserGradeCommand;
import com.ych.pjt.command.UserSearchCommand;
import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dao.ResDao;
import com.ych.pjt.util.Constant;

@Controller
public class AdminController {
	
	private IYchCommand com;
	
	private AdminDao adDao;
	@Autowired
	public void setAdDao(AdminDao adDao) {
		this.adDao = adDao;
		Constant.adDao=adDao;
	}
	
	
	@RequestMapping("/admin")
	public String admin(HttpServletRequest req,Model model) {
		System.out.println("admin");
		
		return "admin";
	}
	
	

	@RequestMapping("/userGrade")
	public String userGrade(HttpServletRequest req, Model model) {
		System.out.println("userGrade");
		com = new UserGradeCommand();
		com.execute(req, model);
		return "userGrade"; 
	}
	
	@RequestMapping("/userSearch")
	public String userSearch(HttpServletRequest req, Model model) {
		System.out.println("userSearch");
		com = new UserSearchCommand();
		com.execute(req, model);
		return "userGrade";
	}
}
