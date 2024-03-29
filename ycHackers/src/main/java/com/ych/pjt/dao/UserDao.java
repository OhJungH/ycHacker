package com.ych.pjt.dao;

import java.util.ArrayList;

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
		dto=userAuthTransfer(dto);
		return dto;
	}
	private UserDataDto userAuthTransfer(UserDataDto dto) {
		String dbAuth = dto.getUserAuth();
		String userAuth="";
		System.out.println("auth check: "+dbAuth);
		if(dbAuth.contains("_USER"))userAuth="�젙�쉶�썝";
		else if(dbAuth.contains("_TEMPUSER"))userAuth="SNS 濡쒓렇�씤 �쉶�썝";
		else if(dbAuth.contains("_MANAGER"))userAuth="移댄럹 留ㅻ땲��";
		else if(dbAuth.contains("_ADMIN"))userAuth="�럹�씠吏� �슫�쁺�옄";
		else userAuth=dbAuth;
		System.out.println("auth transfer result: "+userAuth);
		dto.setUserAuth(userAuth);
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
	/*회원 정보*/
	@Override 
	public UserDataDto userInfoView(int userNum) {
		System.out.println("userInfoView dao");
		UserDataDto dto = sqlSession.selectOne("userInfoView",userNum);
		return dto;
	}
}
