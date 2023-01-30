package com.ych.pjt.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ych.pjt.command.CafeListCommand;
import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.command.StudyroomWriteCommand;
import com.ych.pjt.dao.CafeDao;
import com.ych.pjt.dto.CafeDto;
import com.ych.pjt.util.Constant;
@Controller
public class CafeController {
	private IYchCommand com;
	
	private CafeDao cDao;
	@Autowired
	public void setDao(CafeDao cDao) {
		this.cDao  = cDao;
		Constant.cDao = cDao;
	}
	
	@RequestMapping("/cafeList")
	public String cafeList(HttpServletRequest req, Model model) {
		System.out.println("cafeList");
		com = new CafeListCommand();
		com.execute(req, model);
		return "cafeList";
	}
	
	@RequestMapping("/studyroomwrite")
	public String studyroom(HttpServletRequest req, Model model) {
		System.out.println("studyroomwrite");
		return "studyroomwrite";
	}
	
	@RequestMapping(value="/studyroomWrite", produces="application/text; charset=UTF-8")
	@ResponseBody
	public String StudyroomWrite(MultipartHttpServletRequest mphr, Model model,
			@RequestParam("cafeImage") MultipartFile[] files ) {
		System.out.println("studyroomWrite");
		String cafeName = mphr.getParameter("cafeName");
		String cafeLocation = mphr.getParameter("cafeLocation");
		String cafePrice = mphr.getParameter("cafePrice");
		String cafeMember1 = mphr.getParameter("cafeMember");
		int cafeMember = Integer.parseInt(cafeMember1);
		String cafeIntro = mphr.getParameter("cafeIntro");
		String cafeTel1 = mphr.getParameter("cafeTel");
		int cafeTel = Integer.parseInt(cafeTel1);
		String cafeTime = mphr.getParameter("cafeTime");
		String cafeImage = null;
		MultipartFile mfti = mphr.getFile("cafeImage");
		
		String path = "C:/Users/new/git/ych/ycHackers/src/main/webapp/resources/upImage";
		
		String originFileName = mfti.getOriginalFilename();
		long prename = System.currentTimeMillis();
		long fileSize = mfti.getSize();
		String safeFile = path + prename + originFileName;
		cafeImage = prename + originFileName;
		CafeDto cdto = new CafeDto(cafeName, cafeLocation, cafePrice, cafeImage, 0, 0, cafeIntro, 0, cafeTime);
		mphr.setAttribute("cdto", cdto);
		com = new StudyroomWriteCommand();
		com.execute(mphr, model);
		
		Map<String, Object>map = model.asMap();
		String res = (String)map.get("result");
		System.out.println("res :" + res);
		if(res.equals("success")) {
			try {
				mfti.transferTo(new File(safeFile));
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return "write-success";
		}
		else {
			return "write-failed";
		}
	}
}
