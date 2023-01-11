package com.ych.pjt.command;

import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;

import com.ych.pjt.dao.UserDao;
import com.ych.pjt.dto.UserDataDto;
import com.ych.pjt.util.Constant;

public class UserJoinCommand implements IYchCommand {
	@Override
	public void execute(HttpServletRequest req, Model model) {
		BCryptPasswordEncoder passwordEncoder = Constant.passwordEncoder;
		
		int num = 0;
		String id = req.getParameter("userId");
		String pw = req.getParameter("userPw");
		String pw_org = pw;
		pw = passwordEncoder.encode(pw_org);
		String auth = req.getParameter("userAuth");
		String name = req.getParameter("userName");
		String phone = req.getParameter("userPhone");
		String birthSt = req.getParameter("userBirth");
		Date birth = Date.valueOf(birthSt);
		String locationSt = req.getParameter("userLocation");
		int location = Integer.parseInt(locationSt);
		String genderSt = req.getParameter("userGender");
		int gender = Integer.parseInt(genderSt);
		Timestamp joinDate = null;
		System.out.println("data: "+id+"/ "+auth+"/ "+name+"/ "+phone+"/ "+birth+"/ "+location+"/ "+gender);
		UserDataDto dto = new UserDataDto(num,id,pw,auth,name,phone,birth,location,gender,joinDate);
		
		UserDao udao = Constant.uDao;
		String result = udao.userJoin(dto);
		System.out.println("result: "+result);
		req.setAttribute("result", result);
	}
}
