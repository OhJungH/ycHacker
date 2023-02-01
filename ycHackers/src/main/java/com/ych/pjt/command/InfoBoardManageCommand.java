package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoBoardManageCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		AdminDao adDao = Constant.adDao;
		ArrayList<InfoBoardDto> dtos = adDao.infoBoardManage();
		model.addAttribute("infoBoardList",dtos);
		model.addAttribute("listSize",dtos.size());
	}

}
