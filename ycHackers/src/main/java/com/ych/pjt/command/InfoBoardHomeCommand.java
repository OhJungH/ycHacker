package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoBoardHomeCommand implements IYchCommand {
	@Override
	public void execute(HttpServletRequest req, Model model) {
		System.out.println("InfoBoardHomeCommand");
		AdminDao adDao = Constant.adDao;
		ArrayList<InfoBoardDto> dtos = adDao.infoBoardHome();
		model.addAttribute("infoHomeList",dtos);
	}

}
