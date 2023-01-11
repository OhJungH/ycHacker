package com.ych.pjt.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class UserDataDto {
	private int userNum;
	private String userId;
	private String userPw;
	private String userAuth;
	private String userName;
	private String userPhone;
	private Date userBirth;
	private int userLocation;
	private int userGender;
	private Timestamp userDate;//join date	
	
	//constructor
	public UserDataDto() {
		super();
	}
	public UserDataDto(int userNum, String userId, String userPw, String userAuth, String userName, String userPhone,
			Date userBirth, int userLocation, int userGender, Timestamp userDate) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPw = userPw;
		this.userAuth = userAuth;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userBirth = userBirth;
		this.userLocation = userLocation;
		this.userGender = userGender;
		this.userDate = userDate;
	}
	
	//getter&setter
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserAuth() {
		return userAuth;
	}
	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public int getUserLocation() {
		return userLocation;
	}
	public void setUserLocation(int userLocation) {
		this.userLocation = userLocation;
	}
	public int getUserGender() {
		return userGender;
	}
	public void setUserGender(int userGender) {
		this.userGender = userGender;
	}
	public Timestamp getUserDate() {
		return userDate;
	}
	public void setUserDate(Timestamp userDate) {
		this.userDate = userDate;
	}
}
