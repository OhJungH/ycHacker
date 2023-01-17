package com.ych.pjt.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.UserJoinCommand;
import com.ych.pjt.command.UserMainDataCommand;
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
	@RequestMapping("/main")
	public String main(HttpServletRequest req, Model model, Authentication authentication) {
		System.out.println("main page request:"+authentication);
		getUsername(authentication, req);
		
		//username, auth 확인
		String userName = (String)req.getAttribute("username");
		String auth = (String)req.getAttribute("auth");
		System.out.println("user data: "+userName+"//"+auth);
		//user data load
		com= new UserMainDataCommand();
		com.execute(req, model);
		//board관련 load
		
		return "main";
	}
	private void getUsername(Authentication authentication,HttpServletRequest req) {
		UserDetails userDetails = (UserDetails)authentication.getPrincipal();
		String username = userDetails.getUsername();
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		String auth = authorities.toString();
		req.setAttribute("username", username);
		req.setAttribute("auth", auth);
	}
	@RequestMapping("/processLogin")
	public String processLogin(
			@RequestParam(value="log", required=false) String log,
			@RequestParam(value="logout", required=false) String logout,
			@RequestParam(value="error", required=false) String error,
			HttpSession session, Model model) {
		System.out.println("log process controller(log,logout,error): "+log+"/"+logout+"/"+error);
		if(log!=null&&log!="") model.addAttribute("log", "before login");
		if(logout!=null&&logout!="") model.addAttribute("logout", "You've been logged out successfully");
		if(error!=null&&error!="") model.addAttribute("error", "Invalid username or password");
		return "loginView";
	}
	@RequestMapping("/logoutView")
	public String logoutView(HttpServletRequest req, Model model) {
		System.out.println("log out request");
		return "logoutView";
	}
}