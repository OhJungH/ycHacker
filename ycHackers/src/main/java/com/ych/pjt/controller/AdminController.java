package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ych.pjt.command.ChangeGradeCommand;
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
		System.out.println("admin page request");
		//공지 게시판 최근 5개 호출 command
		//page 정보 관련 data 호출 command
		return "adminPage";
	}	
	//사용되는 DB를 중점으로 해야할지 사용자를 중점으로 할지 정해야할득
	//user관련은 user Controller?
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
	@RequestMapping(value="/changeGrade",method = RequestMethod.POST)
	public String changeGrade(HttpServletRequest req, Model model) {
		// grade change
		com = new ChangeGradeCommand();
		com.execute(req, model);
		// user grade List
		com = new UserGradeCommand();
		com.execute(req, model);
		return "userGrade";
	}
	//cafe관련은..어떻게?
	@RequestMapping("/studyroomwrite")
	public String studyroom(HttpServletRequest req, Model model) {
		System.out.println("studyroomwrite");
		return "studyroomwrite";
	}
}
