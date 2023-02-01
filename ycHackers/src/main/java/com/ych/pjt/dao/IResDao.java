package com.ych.pjt.dao;

import java.util.ArrayList;

import com.ych.pjt.dto.ResDto;

public interface IResDao {
	public String res(ResDto dto);
	public ArrayList<ResDto> myResInfo();
	public ResDto resModifyView(int resNum);
}
