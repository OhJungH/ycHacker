package com.ych.pjt.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ych.pjt.command.ChangeGradeCommand;
import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.InfoBoardHomeCommand;
import com.ych.pjt.command.InfoBoardManageCommand;
import com.ych.pjt.command.InfoBoardPageListCommand;
import com.ych.pjt.command.UserGradeCommand;
import com.ych.pjt.command.UserSearchCommand;
import com.ych.pjt.dao.AdminDao;
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
	
	@RequestMapping("/admin")//admin page
	public String admin(HttpServletRequest req,Model model) {
		System.out.println("admin page request");
		//공지 게시판 최근 5개 호출 command
		//page 정보 관련 data 호출 command
		return "adminPage";
	}	
	/*공지게시판 관련 request*/
	@RequestMapping("/infoBoardHome")
	public String infoBoardHome(HttpServletRequest req, Model model) {
		System.out.println("infoBoard show from Home request");
		com = new InfoBoardHomeCommand();
		com.execute(req, model);
		return "infoBoardHome";
	}
	@RequestMapping("/infoBoardManage")//관리자
	public String infoBoardManage(HttpServletRequest req, Model model) {
		System.out.println("infoBoardManage request");
		com = new InfoBoardManageCommand();
		com.execute(req, model);
		return "infoBoardManage";
	}
	@RequestMapping("/infoPList")
	public String infoPList(HttpServletRequest req, Model model) {
		String pageNum = req.getParameter("pageNo");
		System.out.println("infoBoard page request: "+pageNum);
		com=new InfoBoardPageListCommand();
		com.execute(req, model);
		return "infoBoardPList";
	}
	@RequestMapping("/infoBoardWriteForm")
	public String infoBoardWriteForm() {
		System.out.println("infoBoardWriteForm request");
		return "infoBoardWriteForm";
	}

	
	
}
