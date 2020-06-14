package com.aboplate.app.picture.dao;

public class PictureBean {
	private int review_num;
	private String picture_path;
	
	public PictureBean() {;}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getPicture_path() {
		return picture_path;
	}

	public void setPicture_path(String picture_path) {
		this.picture_path = picture_path;
	}	
	
}
