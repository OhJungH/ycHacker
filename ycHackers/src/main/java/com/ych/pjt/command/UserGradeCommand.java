package com.ych.pjt.command;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class UserGradeCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		AdminDao adDao = Constant.adDao;
		
		
		ArrayList<UserDataDto> dtos = adDao.userList();
		model.addAttribute("userList", dtos);
	
		
		
	}
}
