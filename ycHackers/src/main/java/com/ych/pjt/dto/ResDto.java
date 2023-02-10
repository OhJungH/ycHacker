package com.ych.pjt.dto;

public class ResDto {
	private int resNum;
	private String resName;
	private String resBirth;
	private String resPhone;
	private String resDate;
	private String resTime;
	private String resMember;
	private String payMents;
	private String cafePhone;
	private String resComments;
	
	public ResDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResDto(int resNum, String resName, String resBirth, String resPhone, String resDate, String resTime,
			String resMember, String payMents,String cafePhone ,String resComments) {
		super();
		this.resNum = resNum;
		this.resName = resName;
		this.resBirth = resBirth;
		this.resPhone = resPhone;
		this.resDate = resDate;
		this.resTime = resTime;
		this.resMember = resMember;
		this.payMents = payMents;
		this.cafePhone = cafePhone;
		this.resComments = resComments;
	}

	public int getResNum() {
		return resNum;
	}

	public void setResNum(int resNum) {
		this.resNum = resNum;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public String getResBirth() {
		return resBirth;
	}

	public void setResBirth(String resBirth) {
		this.resBirth = resBirth;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getResTime() {
		return resTime;
	}

	public void setResTime(String resTime) {
		this.resTime = resTime;
	}

	public String getResMember() {
		return resMember;
	}

	public void setResMember(String resMember) {
		this.resMember = resMember;
	}

	public String getPayMents() {
		return payMents;
	}

	public void setPayMents(String payMents) {
		this.payMents = payMents;
	}


	public String getCafePhone() {
		return cafePhone;
	}

	public void setCafePhone(String cafePhone) {
		this.cafePhone = cafePhone;
	}
	public String getResComments() {
		return resComments;
	}
	
	public void setResComments(String resComments) {
		this.resComments = resComments;
	}
	
}
