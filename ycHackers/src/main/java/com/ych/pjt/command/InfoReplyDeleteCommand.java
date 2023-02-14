package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.util.Constant;

public class InfoReplyDeleteCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String infoNumST = req.getParameter("replyNum");
		System.out.println("InfoReplyDeleteCommand: "+infoNumST);
		int infoNum=Integer.parseInt(infoNumST);
		
		AdminDao adDao=Constant.adDao;
		adDao.infoReplyDelete(infoNum);
	}

}
