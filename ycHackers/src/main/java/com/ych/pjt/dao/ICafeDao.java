package com.ych.pjt.dao;

import java.util.ArrayList;

import com.ych.pjt.dto.CafeDto;

public interface ICafeDao {

	public ArrayList<CafeDto> cafeList();
	public String studyroomWrite(CafeDto dto);
	public CafeDto cafeDetail(String cafeName);
	public ArrayList<CafeDto> cafeSearch(String location, String searchWhat, String search);



	
}
