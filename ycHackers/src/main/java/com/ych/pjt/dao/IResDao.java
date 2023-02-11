package com.ych.pjt.dao;

import java.util.ArrayList;

import com.ych.pjt.dto.ResDto;

public interface IResDao {
	public String res(ResDto dto);
	public ArrayList<ResDto> myResInfo();
	//update
	public ResDto resModifyView(int resNum);
	public void resModify(ResDto dto);
	//delete
	public ResDto resDeleteView(int resNum);
	public void resDelete(int resNum);
}
