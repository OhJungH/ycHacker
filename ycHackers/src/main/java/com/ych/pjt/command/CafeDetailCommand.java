package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.CafeDao;
import com.ych.pjt.dto.CafeDto;
import com.ych.pjt.util.Constant;

public class CafeDetailCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		
		CafeDao cdao = Constant.cDao;
	}

}
