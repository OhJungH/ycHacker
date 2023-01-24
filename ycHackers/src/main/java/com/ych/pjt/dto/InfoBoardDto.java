package com.ych.pjt.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class InfoBoardDto {
	private int infoNum;
	private String infoType;
	private String infoAuthor;
	private String infoAuth;
	private Timestamp infoDate;
	private Date infoUpdateDate;
	private String infoTitle;
	private String infoContent;
	private int infoGroup;
	private int infoIndent;
	private int infoHit;
	private int infoCondition;
	//default
	public InfoBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	//all fileds
	public InfoBoardDto(int infoNum, String infoType, String infoAuthor, String infoAuth, Timestamp infoDate,
			Date infoUpdateDate, String infoTitle, String infoContent, int infoGroup, int infoIndent, int infoHit,
			int infoCondition) {
		super();
		this.infoNum = infoNum;
		this.infoType = infoType;
		this.infoAuthor = infoAuthor;
		this.infoAuth = infoAuth;
		this.infoDate = infoDate;
		this.infoUpdateDate = infoUpdateDate;
		this.infoTitle = infoTitle;
		this.infoContent = infoContent;
		this.infoGroup = infoGroup;
		this.infoIndent = infoIndent;
		this.infoHit = infoHit;
		this.infoCondition = infoCondition;
	}
	//insert
	public InfoBoardDto(int infoNum, String infoType, String infoAuthor, String infoAuth, Timestamp infoDate,
			String infoTitle, String infoContent) {
		super();
		this.infoNum = infoNum;
		this.infoType = infoType;
		this.infoAuthor = infoAuthor;
		this.infoAuth = infoAuth;
		this.infoDate = infoDate;
		this.infoTitle = infoTitle;
		this.infoContent = infoContent;
	}
	//getter/setter
	public int getInfoNum() {
		return infoNum;
	}
	public void setInfoNum(int infoNum) {
		this.infoNum = infoNum;
	}
	public String getInfoType() {
		return infoType;
	}
	public void setInfoType(String infoType) {
		this.infoType = infoType;
	}
	public String getInfoAuthor() {
		return infoAuthor;
	}
	public void setInfoAuthor(String infoAuthor) {
		this.infoAuthor = infoAuthor;
	}
	public String getInfoAuth() {
		return infoAuth;
	}
	public void setInfoAuth(String infoAuth) {
		this.infoAuth = infoAuth;
	}
	public Timestamp getInfoDate() {
		return infoDate;
	}
	public void setInfoDate(Timestamp infoDate) {
		this.infoDate = infoDate;
	}
	public Date getInfoUpdateDate() {
		return infoUpdateDate;
	}
	public void setInfoUpdateDate(Date infoUpdateDate) {
		this.infoUpdateDate = infoUpdateDate;
	}
	public String getInfoTitle() {
		return infoTitle;
	}
	public void setInfoTitle(String infoTitle) {
		this.infoTitle = infoTitle;
	}
	public String getInfoContent() {
		return infoContent;
	}
	public void setInfoContent(String infoContent) {
		this.infoContent = infoContent;
	}
	public int getInfoGroup() {
		return infoGroup;
	}
	public void setInfoGroup(int infoGroup) {
		this.infoGroup = infoGroup;
	}
	public int getInfoIndent() {
		return infoIndent;
	}
	public void setInfoIndent(int infoIndent) {
		this.infoIndent = infoIndent;
	}
	public int getInfoHit() {
		return infoHit;
	}
	public void setInfoHit(int infoHit) {
		this.infoHit = infoHit;
	}
	public int getInfoCondition() {
		return infoCondition;
	}
	public void setInfoCondition(int infoCondition) {
		this.infoCondition = infoCondition;
	}
}
