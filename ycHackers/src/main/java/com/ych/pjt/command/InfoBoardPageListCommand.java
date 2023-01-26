package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.InfoDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoBoardPageListCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		InfoDao iDao = Constant.iDao;
		String pageNum = req.getParameter("pageNo");
		System.out.println("infoBoard page List command: "+pageNum);
		ArrayList<InfoBoardDto> dtos = iDao.infoPageList(pageNum);
		model.addAttribute("listContent", dtos);
	}

}
