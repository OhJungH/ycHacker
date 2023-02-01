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
		
		String infoType=req.getParameter("infoType");
		String infoAuthor=req.getParameter("infoAuthor");
		String infoAuth=req.getParameter("infoAuth");
		String infoTitle=req.getParameter("infoTitle");
		String infoContent=req.getParameter("infoContent");
		String infoConditionST=req.getParameter("infoCondition");
		int infoCondition=0;
		if(infoConditionST.equals("display")) {
			infoCondition=10;
		}else if(infoConditionST.equals("display-none")){
			infoCondition=-10;
		}
		System.out.println("infoBoardData: "+infoType+"/"+infoAuthor+"("+infoAuth+")/"+infoTitle+"/"+infoCondition);
		System.out.println("infoContent: "+infoContent);
		
		InfoBoardDto dto = new InfoBoardDto(infoType,infoAuthor,infoAuth,infoTitle,infoContent,infoCondition);
		AdminDao adDao=Constant.adDao;
		adDao.infoWrite(dto);
	}

}
