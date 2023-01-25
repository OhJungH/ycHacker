package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dto.ResDto;
import com.ych.pjt.util.Constant;

public class MyResInfoCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		BCryptPasswordEncoder passwordEncoder=Constant.passwordEncoder;
		
		ResDao rDao = Constant.rDao;
		String resNum = (String)req.getAttribute("resnum");
		System.out.println("myResInfoView Data");
		
		ResDto dto = rDao.myResInfo(resNum);
		model.addAttribute("ResDto",dto);
		System.out.println("123");
	}
}



