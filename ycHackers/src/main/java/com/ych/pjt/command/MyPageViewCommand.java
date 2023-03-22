package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.UserDao;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class MyPageViewCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		UserDao uDao = Constant.uDao;
		String userNum = req.getParameter("userNum");
		System.out.println("UserInfoView command :" + userNum);
		int usernum = Integer.parseInt(userNum);
		
		UserDataDto dto = uDao.userInfoView(usernum);
		
		model.addAttribute("userDataDto",dto);
	}

}
