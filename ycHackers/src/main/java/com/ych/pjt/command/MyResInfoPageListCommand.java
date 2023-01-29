package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class MyResInfoPageListCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		ResDao rDao = Constant.rDao;
		String pageNo = req.getParameter("pageNo");
		ArrayList<ResDto> dtos = rDao.myResInfoPageList(pageNo);
		model.addAttribute("listContent",dtos);

	}

}
