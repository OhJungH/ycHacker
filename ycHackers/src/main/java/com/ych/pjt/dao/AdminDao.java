package com.ych.pjt.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.UserDataDto;

public class AdminDao implements IAdminDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<UserDataDto> userList() {
		
		ArrayList<UserDataDto> dtos = (ArrayList)sqlSession.selectList("userList");
		
		return dtos;
	}
	
	



}
