package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoBoardPagelistCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		AdminDao adDao = Constant.adDao;
		String pageNum = req.getParameter("pageNo");
		System.out.println("infoBoard page List command: "+pageNum);
		ArrayList<InfoBoardDto> dtos = adDao.infoBoardPagelist(pageNum);
		model.addAttribute("infoList", dtos);
		model.addAttribute("listSize",dtos.size());
	}
}
