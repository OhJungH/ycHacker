package com.ych.pjt.dto;

public class CafeDto {

	private String cafeName;
	private String cafeLocation;
	private String cafePrice;
	private String cafeImage;
	private int cafeMember;
	private int cafeLike;
	private String cafeIntro;
	private int number;
	public CafeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CafeDto(String cafeName, String cafeLocation, String cafePrice, String cafeImage, int cafeMember,
			int cafeLike, String cafeIntro, int number) {
		super();
		this.cafeName = cafeName;
		this.cafeLocation = cafeLocation;
		this.cafePrice = cafePrice;
		this.cafeImage = cafeImage;
		this.cafeMember = cafeMember;
		this.cafeLike = cafeLike;
		this.cafeIntro = cafeIntro;
		this.number = number;
	}
	public String getCafeName() {
		return cafeName;
	}
	public void setCafeName(String cafeName) {
		this.cafeName = cafeName;
	}
	public String getCafeLocation() {
		return cafeLocation;
	}
	public void setCafeLocation(String cafeLocation) {
		this.cafeLocation = cafeLocation;
	}
	public String getCafePrice() {
		return cafePrice;
	}
	public void setCafePrice(String cafePrice) {
		this.cafePrice = cafePrice;
	}
	public String getCafeImage() {
		return cafeImage;
	}
	public void setCafeImage(String cafeImage) {
		this.cafeImage = cafeImage;
	}
	public int getCafeMember() {
		return cafeMember;
	}
	public void setCafeMember(int cafeMember) {
		this.cafeMember = cafeMember;
	}
	public int getCafeLike() {
		return cafeLike;
	}
	public void setCafeLike(int cafeLike) {
		this.cafeLike = cafeLike;
	}
	public String getCafeIntro() {
		return cafeIntro;
	}
	public void setCafeIntro(String cafeIntro) {
		this.cafeIntro = cafeIntro;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}
