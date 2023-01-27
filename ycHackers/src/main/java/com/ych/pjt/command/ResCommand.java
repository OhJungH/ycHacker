package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class ResCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {	
		int num = 0;
		String name = req.getParameter("resName");
		String birth = req.getParameter("resBirth");
		String phone = req.getParameter("resPhone");
		String date = req.getParameter("resDate");
		String time = req.getParameter("resTime");
		String member = req.getParameter("resMember");
		String payments = req.getParameter("payMents");
		String comments = req.getParameter("resComments");
		String cafephone = req.getParameter("cafePhone");
		
		ResDto dto = new ResDto(num, name, birth, phone, date, time, member, payments,comments, cafephone);
		
		ResDao rdao = Constant.rDao;
		String result = rdao.res(dto);
		System.out.println("result : " + result);	
		req.setAttribute("result",result);
	}
}
