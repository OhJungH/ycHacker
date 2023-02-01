package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class ResModifyCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		
		ResDao rDao = Constant.rDao;
		String resNum = req.getParameter("resNum");		
		System.out.println("resmodify command : " +resNum);		
		int resnum = Integer.parseInt(resNum);
		
		ResDto dto = rDao.resModifyView(resnum);
		
		model.addAttribute("resDto", dto);
	}

}
