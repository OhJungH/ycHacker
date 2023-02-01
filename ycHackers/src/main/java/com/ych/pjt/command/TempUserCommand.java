package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.UserDao;
import com.ych.pjt.dto.TempUserDto;
import com.ych.pjt.util.Constant;

public class TempUserCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		UserDao uDao=Constant.uDao;
		TempUserDto dto = (TempUserDto)req.getAttribute("dto");
		uDao.tempUserDB(dto);
	}

}
