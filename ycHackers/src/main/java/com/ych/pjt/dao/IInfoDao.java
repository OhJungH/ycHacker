package com.ych.pjt.dao;

import java.util.ArrayList;

import com.ych.pjt.dto.InfoBoardDto;

public interface IInfoDao {
	public ArrayList<InfoBoardDto> infoBoardHome();
	public ArrayList<InfoBoardDto> infoBoardManage();
	public ArrayList<InfoBoardDto> infoPageList(String pageNum);
}
