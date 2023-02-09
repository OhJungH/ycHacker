package com.ych.pjt.command;


import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoModifyCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String infoNumST=req.getParameter("infoNum");
		System.out.println("InfoModify Command: "+infoNumST);
		
		if(infoNumST.equals("")&&infoNumST==null) {
			System.out.println("infoNum is null");
		}
		else {
			int infoNum = Integer.parseInt(infoNumST);
			String infoAuthor=req.getParameter("infoAuthor");
			String infoAuth=req.getParameter("infoAuth");
			String infoUpdateDate=req.getParameter("infoUpdateDate");
			String infoTitle=req.getParameter("infoTitle");
			String infoContent=req.getParameter("infoContent");
			String infoConditionST=req.getParameter("infoCondition");
			int infoCondition=0;
			if(infoConditionST.equals("display"))infoCondition=10;
			else if(infoConditionST.equals("display-none"))infoCondition=-10;
			System.out.println(infoNum+"/ "+infoTitle+"/ "+infoUpdateDate+"/ "+infoAuthor+"("+infoAuth+")/ "
					+infoContent+"/ "+infoCondition);
			InfoBoardDto dto = new InfoBoardDto(infoNum,infoAuthor,infoAuth,infoUpdateDate,infoTitle,infoContent,infoCondition);
			
			AdminDao adDao=Constant.adDao;
			adDao.infoModify(dto);
		}
	}
}
