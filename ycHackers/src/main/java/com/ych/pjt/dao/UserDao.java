package com.ych.pjt.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

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
			System.out.println("dao res: "+res);
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
}
