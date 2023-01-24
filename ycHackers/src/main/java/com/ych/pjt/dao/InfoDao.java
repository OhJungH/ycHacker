package com.ych.pjt.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.InfoBoardDto;

public class InfoDao implements IInfoDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<InfoBoardDto> infoBoardHome() {
		System.out.println("InfoBoard list method");
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoBoardHome");
		return dtos;
	}
	
	
}