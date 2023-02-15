package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoReplyListAdminCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String infoNumST=req.getParameter("infoNum");
		System.out.println("InfoReplyAdminViewCommand: "+infoNumST);
		int infoNum=Integer.parseInt(infoNumST);
		AdminDao adDao = Constant.adDao;
		ArrayList<InfoBoardDto> dtos = adDao.infoReplyListAdmin(infoNum);
		model.addAttribute("infoReplyList", dtos);
		model.addAttribute("infoNum", infoNum);
	}

}
