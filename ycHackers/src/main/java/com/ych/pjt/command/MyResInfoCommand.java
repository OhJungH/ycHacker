package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class MyResInfoCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		ResDao rDao = Constant.rDao;
		String resNum = req.getParameter("resNum");
		int resNUM = Integer.parseInt(resNum);
		System.out.println("resNum Modify: " + resNUM);
		ResDto dto = rDao.resModify(resNUM);
		model.addAttribute("resModify",dto);
		System.out.println(resNum +"/");
	}

}

