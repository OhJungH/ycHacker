package com.ych.pjt.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ych.pjt.dto.InfoBoardDto;
import com.ych.pjt.dto.UserDataDto;

public class AdminDao implements IAdminDao {
	@Autowired
	private SqlSession sqlSession;
	
	/*user Role change method*/
	@Override
	public ArrayList<UserDataDto> userList() {
		ArrayList<UserDataDto> dtos = (ArrayList)sqlSession.selectList("userList");
		return dtos;
	}
	@Override
	public ArrayList<UserDataDto> userSearch() {
		ArrayList<UserDataDto> dtos = new ArrayList<UserDataDto>();
		dtos = (ArrayList)sqlSession.selectList("userList");
		return dtos;
	}
	@Override
	public void changeGrade(UserDataDto dto) {
		int res = sqlSession.update("changeGrade", dto);
	}	
	/*information Board method*/
	@Override
	public ArrayList<InfoBoardDto> infoBoardHome() {
		System.out.println("InfoBoard list method");
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoBoardHome");
		return dtos;
	}
	@Override
	public ArrayList<InfoBoardDto> infoBoardManage() {
		System.out.println("infoBoard manage first List method");
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoBoardManage");
		return dtos;
	}
	@Override
	public ArrayList<InfoBoardDto> infoPageList(String pageNum) {
		System.out.println("infoBoard mangage page List method: "+pageNum);
		int page = Integer.parseInt(pageNum);
		int startN = 0;
		if(page!=1)startN=(page-1)*10+1;
		System.out.println("start page number: "+startN);
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoPageList", startN);
		return dtos; 
	}
	@Override
	public void infoWrite(InfoBoardDto dto) {
		System.out.println("infoformation Board Write method: "+dto.getInfoTitle());
		int res = sqlSession.insert("infoWrite", dto);
		System.out.println("infoWrite result: "+res);
		infoGroupUpdate();
	}
	//sequences DB가 닫히는 문제로 분할해 적용 
	private void infoGroupUpdate() {
		int res = sqlSession.update("infoGroupUpdate");
		System.out.println("infogroupUpdate: "+res);
	}
	@Override
	public ArrayList<InfoBoardDto> infoListMain() {
		System.out.println("infoListMain method");
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoListMain");
		return dtos;
	}
	private ArrayList<InfoBoardDto> AuthorTransfer(ArrayList<InfoBoardDto> dtos){
		String message="[AuthorTransfer] \n";
		for(int i=0;i<dtos.size();i++) {
			InfoBoardDto dto=dtos.get(i);
			String dbAuthor = dto.getInfoAuth();
			String userAuthor="";
			if(dbAuthor.contains("_USER"))userAuthor="정회원";
			else if(dbAuthor.contains("_TEMPUSER"))userAuthor="SNS 로그인 회원";
			else if(dbAuthor.contains("_MANAGER"))userAuthor="카페 매니저";
			else if(dbAuthor.contains("_ADMIN"))userAuthor="페이지 운영자";
			else userAuthor=dbAuthor;
			dto.setInfoAuth(userAuthor);
			dtos.set(i, dto);
			message+="index: "+i+"// db Auth: "+dbAuthor+" >>transfer>> userAuthor: "+userAuthor+"\n";
		}
		message+="[complete]: "+dtos.size()+" Data Transfer Objects";
		System.out.println(message);
		return dtos;
	}
	private InfoBoardDto AuthorTransfer(InfoBoardDto dto){
		String message="[AuthorTransfer] \n";
			String dbAuthor = dto.getInfoAuth();
			String userAuthor="";
			if(dbAuthor.contains("_USER"))userAuthor="정회원";
			else if(dbAuthor.contains("_TEMPUSER"))userAuthor="SNS 로그인 회원";
			else if(dbAuthor.contains("_MANAGER"))userAuthor="카페 매니저";
			else if(dbAuthor.contains("_ADMIN"))userAuthor="페이지 운영자";
			else userAuthor=dbAuthor;
			dto.setInfoAuth(userAuthor);
			message+="db Auth: "+dbAuthor+" >>transfer>> userAuthor: "+userAuthor+"\n";
		message+="[complete]";
		System.out.println(message);
		return dto;
	}

	@Override
	public ArrayList<InfoBoardDto> infoBoardList() {
		System.out.println("infoBoarList method");
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoBoardList");
		dtos = AuthorTransfer(dtos);
		return dtos;
	}
	@Override
	public ArrayList<InfoBoardDto> infoBoardPagelist(String pageNum) {
		System.out.println("infoBoard page List method: "+pageNum);
		int page = Integer.parseInt(pageNum);
		int startN=0;
		if(page!=1)startN=(page-1)*50+1;
		System.out.println("start page number: "+startN);
		ArrayList<InfoBoardDto> dtos = (ArrayList)sqlSession.selectList("infoBoardPagelist", startN);
		dtos = AuthorTransfer(dtos);
		return dtos; 
	}
	private void infoBoardHit(int infoNum) {
		System.out.println("whom requests "+infoNum+"(hits up)");
		int res = sqlSession.update("infoBoardHit", infoNum);
		System.out.println("info hit request: "+res);
	}
	@Override
	public InfoBoardDto infoDetailsHome(int infoNum) {
		System.out.println("infoDetailsHome method: "+infoNum);
		InfoBoardDto dto = sqlSession.selectOne("infoDetailsHome", infoNum);
		dto=AuthorTransfer(dto);
		infoBoardHit(infoNum);
		return dto;
	}
	@Override
	public InfoBoardDto infoDetailsUser(int infoNum) {
		System.out.println("infoDetailsUser method: "+infoNum);
		InfoBoardDto dto=sqlSession.selectOne("infoDetailsUser", infoNum);
		dto=AuthorTransfer(dto);
		infoBoardHit(infoNum);
		return dto;
	}



}
