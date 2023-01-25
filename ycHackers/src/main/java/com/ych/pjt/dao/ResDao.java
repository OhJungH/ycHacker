package com.ych.pjt.dao;

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
			int res = sqlSession.insert("Res",dto);
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
	public ResDto myResInfo(String resNum) {
		System.out.println("dao");
		ResDto dto = sqlSession.selectOne("myResInfo",resNum);
		return dto;
	}
}
