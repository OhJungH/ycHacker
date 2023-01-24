package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.InfoBoardHomeCommand;
import com.ych.pjt.dao.InfoDao;
import com.ych.pjt.util.Constant;

@Controller
public class InfoController {
	IYchCommand com;
	
	private InfoDao iDao;
	@Autowired
	public void setiDao(InfoDao iDao) {
		this.iDao=iDao;
		Constant.iDao=iDao;
	}
	
	@RequestMapping("/infoBoardHome")
	public String infoBoardHome(HttpServletRequest req, Model model) {
		System.out.println("infoBoard show from Home request");
		com = new InfoBoardHomeCommand();
		com.execute(req, model);
		return "infoBoardHome";
	}
}
