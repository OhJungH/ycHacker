package com.ych.pjt.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.dto.UserDataDto;

public interface IAdminDao {
	//about user
	public ArrayList<UserDataDto> userList();
	public void changeGrade(UserDataDto dto);
	public ArrayList<UserDataDto> userSearch();
	//about information board 
		//list(with pagination)
	public ArrayList<InfoBoardDto> infoListMain();
	public ArrayList<InfoBoardDto> infoBoardList();
	public ArrayList<InfoBoardDto> infoBoardPagelist(String pageNum);
	public ArrayList<InfoBoardDto> infoBoardHome();
	public ArrayList<InfoBoardDto> infoBoardManage();
	public ArrayList<InfoBoardDto> infoPageList(String pageNum);
		//write
	public void infoWrite(InfoBoardDto dto);
		//read details
	public InfoBoardDto infoDetailsHome(int infoNum);
	public InfoBoardDto infoDetailsUser(int infoNum);
	public InfoBoardDto infoDetailsPreview(int infoNum);
		//update
	public InfoBoardDto infoModifyView(int infoNum);
	public void infoModify(InfoBoardDto dto);
		//delete
	public void infoDelete(int infoNum);
		//reply
	public Timestamp infoReplyCheck(String infoAuthor);
}
