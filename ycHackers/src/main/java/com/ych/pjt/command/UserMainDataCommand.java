package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.UserDao;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class UserMainDataCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		UserDao uDao = Constant.uDao;
		String userName = (String)req.getAttribute("username");
		System.out.println("main page userdata command:"+userName);
		
		UserDataDto dto = uDao.userMainData(userName);
		model.addAttribute("userDto",dto);
	}

}
