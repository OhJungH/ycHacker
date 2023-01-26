package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.InfoDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoBoardManageCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		InfoDao iDao = Constant.iDao;
		ArrayList<InfoBoardDto> dtos = iDao.infoBoardManage();
		model.addAttribute("infoBoardList",dtos);
	}

}
