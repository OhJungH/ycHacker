package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.CafeDao;
import com.ych.pjt.dto.CafeDto;
import com.ych.pjt.util.Constant;

public class StudyroomWriteCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		CafeDao cdao = Constant.cDao;
		CafeDto dto = (CafeDto)req.getAttribute("cdto");
		String result = cdao.studyroomWrite(dto);
		model.addAttribute("result", result);
	}

}
