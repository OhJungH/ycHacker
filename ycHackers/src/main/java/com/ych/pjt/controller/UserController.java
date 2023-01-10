package com.ych.pjt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.ych.pjt.command.IYchCommand;
import com.ych.pjt.dao.UserDao;
import com.ych.pjt.util.Constant;

public class UserController {
	private IYchCommand com;
	
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	public void setPasswordEncoder(BCryptPasswordEncoder passwordEncoder) {
		this.passwordEncoder=passwordEncoder;
		Constant.passwordEncoder=passwordEncoder;
	}
	private UserDao uDao;
	@Autowired
	public void setuDao(UserDao uDao) {
		this.uDao=uDao;
		Constant.uDao=uDao;
	}
	
}