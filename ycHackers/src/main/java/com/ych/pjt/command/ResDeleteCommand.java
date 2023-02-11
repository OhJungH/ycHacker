package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.util.Constant;

public class ResDeleteCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String resnum = req.getParameter("resNum");
		System.out.println("ResDeleteCommand: " + resnum);
		int resNum = Integer.parseInt(resnum);
		ResDao rDao = Constant.rDao;
		rDao.resDelete(resNum);
	}

}
