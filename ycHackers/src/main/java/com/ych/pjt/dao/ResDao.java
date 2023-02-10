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
	/* 내 예약 정보 */
	@Override
	public ArrayList<ResDto> myResInfo() {
		System.out.println("myResInfo list");
		ArrayList<ResDto> dtos = (ArrayList)sqlSession.selectList("myResInfo");
		return dtos;
	}
	/* 예약 수정 */
	@Override
	public ResDto resModifyView(int resNum) {
		System.out.println("resModify list dao");
		ResDto dto = sqlSession.selectOne("resModifyView",resNum);
		return dto;
	}
	@Override
	public void resModify(ResDto dto) {
		int res = sqlSession.update("resModify",dto);
		
	}
}
