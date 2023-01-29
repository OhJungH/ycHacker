package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.MyResInfoCommand;
import com.ych.pjt.command.MyResInfoPageListCommand;
import com.ych.pjt.command.ResCommand;
import com.ych.pjt.dao.ResDao;
import com.ych.pjt.util.Constant;

@Controller
public class ResController {
	private IYchCommand com;
	
	private ResDao rDao;
	@Autowired
	public void setRDao(ResDao rDao) {
		this.rDao = rDao;
		Constant.rDao = rDao;
	}
	
	@RequestMapping("/resForm")
	public String resForm(HttpServletRequest req, HttpServletResponse response, Model model) {
		System.out.println("resForm request");
		com = new ResCommand();
		com.execute(req,model);
		//예약 list를 하는 경우 list용 Command 추가
		return "resForm";
	}
		
	@RequestMapping("/myResInfoView")
	public String myResInfo(HttpServletRequest req, Model model) {
		System.out.println("myResInfoView request");
		com = new MyResInfoCommand();
		com.execute(req, model);
		return "myResInfoView";
	}
	
	@RequestMapping("/resModifyView")
	public String resModifyView(HttpServletRequest req, Model model) {
		System.out.println("resModifyView request");
		return "resModifyView";
	}
	
	@RequestMapping("resCancelView")
	public String resCancelView(HttpServletRequest req, Model model) {
		System.out.println("resCancelView requset");
		return "resCancelView";
	}
	
	@RequestMapping("/myResInfoPList")
	public String myResInfoPList(HttpServletRequest req, Model model) {
		String pageNum = req.getParameter("pageNo");
		System.out.println("myResInfoPList: " + pageNum);
		com = new MyResInfoPageListCommand();
		com.execute(req, model);
		return "myResInfoView";
	
	}
}
