package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class UserSearchCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		AdminDao adDao = Constant.adDao;
		ArrayList<UserDataDto> dtos = adDao.userSearch();
		model.addAttribute("userList", dtos);
	}

}
