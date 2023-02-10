package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class ResModify1Command implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		ResDao rDao = Constant.rDao;
		
		String resNum = req.getParameter("resNum");
		System.out.println("resModify1 command: " + resNum);
		
		int resnum = Integer.parseInt(resNum);
		String name = req.getParameter("resName");
		String birth = req.getParameter("resBirth");
		String phone = req.getParameter("resPhone");
		String date = req.getParameter("resDate");
		String time = req.getParameter("resTime");
		String member = req.getParameter("resMember");
		String payments = req.getParameter("payMents");
		String cafephone = req.getParameter("cafePhone");
		String comments = req.getParameter("resComments");
		
		ResDto dto = new ResDto(resnum,name,birth,phone,date,time,member,payments,cafephone,comments);
		rDao.resModify(dto);		
	}

}
