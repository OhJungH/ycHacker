package com.ych.pjt.dto;

public class CafeDto {

	private String cafeName;
	private String cafeLocation;
	private String cafePrice;
	private String cafeImage;
	private int cafeMember;
	private int cafeLike;
	private String cafeIntro;
	private int cafeTel;
	private String cafeTime;
	public CafeDto() {
		super();
	}
	public CafeDto(String cafeName, String cafeLocation, String cafePrice, String cafeImage, int cafeMember,
			int cafeLike, String cafeIntro, int cafeTel, String cafeTime) {
		super();
		this.cafeName = cafeName;
		this.cafeLocation = cafeLocation;
		this.cafePrice = cafePrice;
		this.cafeImage = cafeImage;
		this.cafeMember = cafeMember;
		this.cafeLike = cafeLike;
		this.cafeIntro = cafeIntro;
		this.cafeTel = cafeTel;
		this.cafeTime = cafeTime;
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
	public int getCafeTel() {
		return cafeTel;
	}
	public void setCafeTel(int cafeTel) {
		this.cafeTel = cafeTel;
	}
	public String getCafeTime() {
		return cafeTime;
	}
	public void setCafeTime(String cafeTime) {
		this.cafeTime = cafeTime;
	}
	
	
	
}
