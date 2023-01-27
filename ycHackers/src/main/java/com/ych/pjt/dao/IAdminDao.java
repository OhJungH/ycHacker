package com.ych.pjt.dao;

import java.util.ArrayList;

import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.dto.UserDataDto;

public interface IAdminDao {

	public ArrayList<UserDataDto> userList();
	public void changeGrade(UserDataDto dto);
	public ArrayList<UserDataDto> userSearch();
	
	public ArrayList<InfoBoardDto> infoBoardHome();
	public ArrayList<InfoBoardDto> infoBoardManage();
	public ArrayList<InfoBoardDto> infoPageList(String pageNum);
	
	
}
