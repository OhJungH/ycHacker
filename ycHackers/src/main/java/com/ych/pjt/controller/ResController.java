package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.ResCommand;
import com.ych.pjt.dao.ResDao;
import com.ych.pjt.util.Constant;

@Controller
public class ResController {
	private IYchCommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
		Constant.passwordEncoder = passwordEncoder;
	}
	private ResDao rDao;
	@Autowired
	public void setRDao(ResDao rDao) {
		this.rDao = rDao;
		Constant.rDao = rDao;
	}
	
	@RequestMapping(value="/Res",method=RequestMethod.POST)
	@ResponseBody
	public String res(HttpServletRequest req, HttpServletResponse response, Model model) {
		System.out.println("Res request");
		com = new ResCommand();
		com.execute(req, model);
		
		String result = (String)req.getAttribute("result");
		if(result.equals("success")) {
			return "join-success";
		}else {
			return "join-failed";
		}
	}
	
	@RequestMapping("/Reservation")
	public String Reservation(HttpServletRequest request, Model model) {
		System.out.println("Res request");
		return "Reservation";
	}

	@RequestMapping("myResInfo")
	public String myResInfo(HttpServletRequest request, Model model) {
		System.out.println("myResInfo request");
		return "myResInfo";
	}
}
