package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoModifyViewCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String infoNumST = req.getParameter("infoNum");
		System.out.println("infoModifyView command: "+infoNumST);
		AdminDao adDao =Constant.adDao;
		int infoNum=Integer.parseInt(infoNumST);
		InfoBoardDto dto = adDao.infoModifyView(infoNum);
		model.addAttribute("infoModifyDto", dto);

	}

}
