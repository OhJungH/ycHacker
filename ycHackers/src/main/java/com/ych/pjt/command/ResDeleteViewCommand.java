package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class ResDeleteViewCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		ResDao rDao = Constant.rDao;
		String resNum = req.getParameter("resNum");
		System.out.println("resDelete command : " +resNum);
		int resnum = Integer.parseInt(resNum);
		
		ResDto dto = rDao.resDeleteView(resnum);
		
		model.addAttribute("resDto", dto);
	}

}
