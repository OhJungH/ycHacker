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
		String searchWhat = req.getParameter("searchWhat");
		String search = req.getParameter("search");
		
		System.out.println(location + searchWhat + search);
		
		ArrayList<CafeDto> dtos = new ArrayList<CafeDto>();
			
			dtos = cdao.cafeSearch(location, searchWhat, search);
			
	 dtos = cdao.cafeList();
	
	 
	 req.setAttribute("location", location);
	 req.setAttribute("searchWhat", searchWhat);
	 req.setAttribute("search", search);
	 
	model.addAttribute("cafeList", dtos);
	
	}

}
