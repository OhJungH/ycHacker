package com.ych.pjt.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.CafeDto;

public class CafeDao implements ICafeDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<CafeDto> cafeList() {
		ArrayList<CafeDto> dtos = (ArrayList)sqlSession.selectList("cafeList");
		return dtos;
	}
	
	@Override
	public String studyroomWrite(CafeDto dto) {
		System.out.println("studyroomWrite");
		String result;
		int res = sqlSession.insert("studyroomWrite",dto);
		if(res > 0) {
			result = "success";
		} else {
			result = "failed";
		}
		return result;
	}
}
