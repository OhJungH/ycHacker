package com.ych.pjt.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.CafeDao;
import com.ych.pjt.dto.CafeDto;
import com.ych.pjt.util.Constant;

public class CafeListCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		
	CafeDao cdao = Constant.cDao;
	
	String location = req.getParameter("location");
	String cafeSearch = req.getParameter("cafeSearch");
	String search = req.getParameter("search");
	String searchWhat = req.getParameter("searchWhat");
	ArrayList<CafeDto> dtos = cdao.cafeList();
	dtos = cdao.cafeSearch(location, search, searchWhat);
	model.addAttribute("cafeList", dtos);
	}

}
