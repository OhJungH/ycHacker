package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class ChangeGradeCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		AdminDao adDao = Constant.adDao;
		String  userId = req.getParameter("userId");
		String  userAuth = req.getParameter("userAuth");
		UserDataDto dto = new UserDataDto();
		dto.setUserAuth(userAuth);
		dto.setUserId(userId);
		String result = adDao.changeGrade(dto);
	}

}
