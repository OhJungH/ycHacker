package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoDetailsReplyListCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String infoGroupST=req.getParameter("infoGroup");
		if(infoGroupST==null) infoGroupST = req.getParameter("infoNum");
		System.out.println("sort data group: "+infoGroupST);
		int infoGroup = Integer.parseInt(infoGroupST);
		
		AdminDao adDao = Constant.adDao;
		ArrayList<InfoBoardDto> dtos=adDao.infoDetailsReplyList(infoGroup);
		model.addAttribute("replyDataList", dtos);
	}

}
