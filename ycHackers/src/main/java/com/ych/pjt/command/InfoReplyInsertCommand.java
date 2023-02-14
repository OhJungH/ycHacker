package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoReplyInsertCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		//num:nextVal, type: reply, condition: -10, date: now()
		String infoNumST = req.getParameter("infoGroup");
		System.out.println("InfoReplyInsertCommand: "+infoNumST);
		
		String infoType="reply";
		String infoAuthor=req.getParameter("infoAuthor");
		String infoAuth=req.getParameter("infoAuth");
		String infoTitle=req.getParameter("infoTitle");
		String infoContent=req.getParameter("infoContent");
		int infoGroup = Integer.parseInt(infoNumST);
		int infoCondition = -10;
		System.out.println("type: "+infoType+"/author: "+infoAuthor+"/auth: "+infoAuth
				+"/title: "+infoTitle+"/content: "+infoContent+"/group "+infoGroup+"/condition "+infoCondition);
		InfoBoardDto dto = new InfoBoardDto(infoType,infoAuthor,infoAuth,infoTitle,infoContent,infoGroup,infoCondition);
		
		AdminDao adDao=Constant.adDao;
		adDao.infoReplyInsert(dto);
	}

}
