package com.ych.pjt.dao;

import com.ych.pjt.dto.TempUserDto;
import com.ych.pjt.dto.UserDataDto;

public interface IUserDao {
	public String userJoin(UserDataDto dto);
	public UserDataDto login(String userId);
	public UserDataDto userMainData(String userId);
	public void tempUserDB(TempUserDto dto);
	public void tempUserJoin(TempUserDto dto);
	public TempUserDto tempUserLogin(String userId);
}
