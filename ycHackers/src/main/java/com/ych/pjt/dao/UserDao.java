package com.ych.pjt.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class UserDao implements IUserDao {
	@Autowired
	private SqlSession sqlSession;
}
