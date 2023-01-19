package com.ych.pjt.dao;

import com.ych.pjt.dto.ResDto;

public interface IResDao {
	public String resForm(ResDto dto);
	public ResDto resModify(int ResDto);
}
