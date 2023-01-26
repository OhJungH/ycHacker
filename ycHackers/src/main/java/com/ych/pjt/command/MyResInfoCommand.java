package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class MyResInfoCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		ResDao rDao = Constant.rDao;
		ArrayList<ResDto> dtos = rDao.myResInfo();
		model.addAttribute("myResInfo1",dtos);
		System.out.println("myResInfoView Data");
		
	}
}



