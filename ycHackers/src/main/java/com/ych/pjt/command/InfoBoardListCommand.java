package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoBoardListCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		System.out.println("infoBoard List Command");
		AdminDao adDao = Constant.adDao;
		ArrayList<InfoBoardDto> dtos=null;
		model.addAttribute("infoBoardList", dtos);
	}

}
