package com.ych.pjt.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ych.pjt.dao.AdminDao;
import com.ych.pjt.dao.CafeDao;
import com.ych.pjt.dao.InfoDao;
import com.ych.pjt.dao.ResDao;
import com.ych.pjt.dao.UserDao;


public class Constant {
	//Data Access Object
	public static UserDao uDao;
	public static InfoDao iDao;
	public static AdminDao adDao;
	public static CafeDao cDao;
	public static ResDao rDao;
	//password encoder
	public static BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
}