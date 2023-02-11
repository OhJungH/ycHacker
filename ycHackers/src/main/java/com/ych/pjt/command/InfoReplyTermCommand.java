package com.ych.pjt.command;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.util.Constant;

public class InfoReplyTermCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String infoAuthor=req.getParameter("infoAuthor");
		System.out.println("10분 입력확인: "+infoAuthor);
		AdminDao adDao=Constant.adDao;
		Timestamp infoDate = adDao.infoReplyCheck(infoAuthor);
		if(infoDate==null) {
			
		}
		else {
			
		}
	}

}
