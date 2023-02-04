package com.ych.pjt.command;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.util.Constant;

public class InfoDetailsCommand implements IYchCommand {

	@Override
	public void execute(HttpServletRequest req, Model model) {
		String infoNum = req.getParameter("infoNum");
		System.out.println("information Board Details at Home: "+infoNum);
		int num = Integer.parseInt(infoNum);
		AdminDao adDao = Constant.adDao;
		InfoBoardDto dto=adDao.infoDetailsHome(num);
		String modalData = infoDetailsModal(dto);
		
		req.setAttribute("modalData", modalData);
		model.addAttribute("infoDetailsHome",dto);
//		model.addAttribute("infoDetailsContant",dto.getInfoContent());
	}
	private String infoDetailsModal(InfoBoardDto dto) {
		//event>success, result>danger, info>info
		String type=dto.getInfoType();
		String badge="";
		if(type.equals("info"))badge="<span class=\"badge badge-info\">공지사항</span> &emsp;\n";
		else if(type.equals("result"))badge="<span class=\"badge badge-danger\">신고처리결과</span> &emsp;\n";
		else if(type.equals("event"))badge="<span class=\"badge badge-success\">이벤트</span> &emsp;\n";
		else badge="invalid data";
		String modalData
				= "<div class=\"modal-header\">\n"+badge
				+ "<h5 class=\"modal-title\">\n"+ dto.getInfoTitle()+"\n</h5>\n</div>\n"
				+ "<div class=\"modal-body\">\n"+dto.getInfoContent()+"\n</div>\n"//ck editor
				+ "<div class=\"modal-footer\">\n <span>"+dto.getInfoDate()+"</span>\n"
				+ "<span>"+dto.getInfoAuth()+"("+dto.getInfoAuthor()+")</span>\n<button type=\"button\" class=\"btn btn-outline-dark\" data-dismiss=\"modal\">\n"
				+ "close\n</button>\n</div>\n";
		return modalData;
	}
}
