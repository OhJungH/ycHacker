package com.ych.pjt.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.CafeDto;

public class CafeDao implements ICafeDao {
	
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<CafeDto> cafeList() {
		ArrayList<CafeDto> dtos = (ArrayList)sqlSession.selectList("cafeList");
		return dtos;
	}
}
