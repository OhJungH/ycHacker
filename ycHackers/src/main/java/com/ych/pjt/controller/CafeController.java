package com.ych.pjt.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ych.pjt.command.CafeListCommand;
import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.dao.CafeDao;
import com.ych.pjt.util.Constant;
@Controller
public class CafeController {
	private IYchCommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	private CafeDao cDao;
	@Autowired
	public void setDao(CafeDao cDao) {
		this.cDao  = cDao;
		Constant.cDao = cDao;
	}
	
	@RequestMapping("/cafeList")
	public String cafeList(HttpServletRequest req, Model model) {
		System.out.println("cafeList");
		com = new CafeListCommand();
		com.execute(req, model);
		return "cafeList";
	}
}
