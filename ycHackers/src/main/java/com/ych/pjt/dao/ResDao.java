package com.ych.pjt.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.ResDto;

public class ResDao implements IResDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String res(ResDto dto) {
		System.out.println("res method");
		String result = null;
		try {
			int res = sqlSession.insert("res",dto);
			if(res > 0){
				result="success";
			}
			else {
				result="failed";
			}
		}
		catch(Exception e){
			e.printStackTrace();
			result="failed";
		}
		
		return result;
	}
	/* �� ���� ���� */
	@Override
	public ArrayList<ResDto> myResInfo() {
		System.out.println("myResInfo list");
		ArrayList<ResDto> dtos = (ArrayList)sqlSession.selectList("myResInfo");
		return dtos;
	}
	
	@Override
	public ArrayList<ResDto> myResInfoPageList(String pageNo) {
		System.out.println("pagelist : " + pageNo);
		int page = Integer.parseInt(pageNo);
		int startNo = (page-1) *10+1;
		System.out.println("startNo : "  + startNo);
		ArrayList<ResDto> result = (ArrayList)sqlSession.selectList("myResInfoPageList",startNo);
		return result;
	}
}
