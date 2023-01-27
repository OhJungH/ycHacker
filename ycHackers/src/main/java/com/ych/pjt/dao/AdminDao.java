package com.ych.pjt.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.dto.UserDataDto;

public class AdminDao implements IAdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	/*user Role change method*/
	@Override
	public ArrayList<UserDataDto> userList() {
		ArrayList<UserDataDto> dtos = (ArrayList)sqlSession.selectList("userList");
		return dtos;
	}
	@Override
	public ArrayList<UserDataDto> userSearch() {
		ArrayList<UserDataDto> dtos = new ArrayList<UserDataDto>();
		dtos = (ArrayList)sqlSession.selectList("userList");
		return dtos;
	}
	@Override
	public void changeGrade(UserDataDto dto) {
		int res = sqlSession.update("changeGrade", dto);
	}	
	/*information Board method*/
	@Override
	public ArrayList<InfoBoardDto> infoBoardHome() {
		System.out.println("InfoBoard list method");
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoBoardHome");
		return dtos;
	}
	@Override
	public ArrayList<InfoBoardDto> infoBoardManage() {
		System.out.println("infoBoard manage first List method");
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoBoardManage");
		return dtos;
	}
	@Override
	public ArrayList<InfoBoardDto> infoPageList(String pageNum) {
		System.out.println("infoBoard mangage page List method: "+pageNum);
		int page = Integer.parseInt(pageNum);
		int startN = (page-1)*10+1;
		System.out.println("start page number: "+startN);
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoPageList", startN);
		return dtos;
	}



}
