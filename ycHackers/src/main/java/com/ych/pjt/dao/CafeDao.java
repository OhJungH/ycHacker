package com.ych.pjt.dao;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.CafeDto;

public class CafeDao implements ICafeDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<CafeDto> cafeList() {
		ArrayList<CafeDto> dtos = (ArrayList)sqlSession.selectList("cafeList");
		return dtos;
	}
	
	@Override
	public String studyroomWrite(CafeDto dto) {
		System.out.println("studyroomWrite");
		String result;
		int res = sqlSession.insert("studyroomWrite",dto);
		if(res > 0) {
			result = "success";
		} else {
			result = "failed";
		}
		return result;
	}


	@Override
	public CafeDto cafeDetail(String cafeName) {
		// TODO Auto-generated method stub
		CafeDto dto = sqlSession.selectOne("cafeDetail",cafeName);
		return dto;
	}

	@Override
	public ArrayList<CafeDto> cafeSearch(String location, String searchWhat, String search) {
		ArrayList<CafeDto> dtos = new ArrayList<CafeDto>();
		if(searchWhat.equals("cafeName")) {
		} else if(searchWhat.equals("location")) {
			List<Integer> noC = sqlSession.selectList("location",search);
			noC.sort(Comparator.reverseOrder());
			for(int i =0; i<noC.size(); i++) {
				int no = noC.get(i);
				dtos.add(sqlSession.selectOne("searchLocation", no));
			}
		} else {
			if(searchWhat.equals("people")) {
				List<Integer> noS = sqlSession.selectList("searchPeople" ,search);
				noS.sort(Comparator.reverseOrder());
				for(int i=0; i<noS.size(); i++) {
					int no = noS.get(i);
					dtos.add(sqlSession.selectOne("searchPeople", no));
				}
			}
		}
		return dtos;
	}

}
