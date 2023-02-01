package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoBoardWriteCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		System.out.println("information Board write command");
		InfoBoardDto dto = (InfoBoardDto) req.getAttribute("infoDto");
		AdminDao adDao=Constant.adDao;
		adDao.infoWrite(dto);
	}

}
