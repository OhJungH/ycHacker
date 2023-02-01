package com.ych.pjt.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.TempUserDto;
import com.ych.pjt.dto.UserDataDto;

public class UserDao implements IUserDao {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String userJoin(UserDataDto dto) {
		System.out.println("userJoin method");
		String result = null;
		try {
			int res = sqlSession.insert("userJoin",dto);
			System.out.println("join request res: "+res);
			if(res>0) {
				result="success";
			}else {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result="failed";
		}
		return result;
	}

	@Override
	public UserDataDto login(String userId) {
		System.out.println("login request: "+userId);
		UserDataDto result=sqlSession.selectOne("login", userId);
		return result;
	}

	@Override
	public UserDataDto userMainData(String userId) {
		System.out.println("userMainData method");
		UserDataDto dto = sqlSession.selectOne("userMainData",userId);
		return dto;
	}

	@Override
	public void tempUserDB(TempUserDto dto) {
		String userId = dto.getUserId();
		System.out.println("checking SNS user method: "+userId);
		TempUserDto duplicationCheck = sqlSession.selectOne("tempUserDB", userId);
		if(duplicationCheck==null) tempUserJoin(dto);
	}
	@Override
	public void tempUserJoin(TempUserDto dto) {
		System.out.println("SNS user join method");
		int res = sqlSession.insert("tempUserJoin",dto);
		System.out.println("tempJoin result: "+res);
	}

	@Override
	public TempUserDto tempUserLogin(String userId) {
		System.out.println("SNS user log in method: "+userId);
		TempUserDto dto = sqlSession.selectOne("tempUserLogin", userId);
		System.out.println("result: "+dto.getUserId());
		return dto;
	}
	
}
