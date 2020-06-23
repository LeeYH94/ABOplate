package com.aboplate.app.restaurant.dao;

public class ReviewBean {
	private int review_num;
	private int restaurant_num;
	private String nickname;
	private String review;
	private int ration;
	private String report;
	private String upload_date;
	
	public ReviewBean() {;}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getRestaurant_num() {
		return restaurant_num;
	}

	public void setRestaurant_num(int restaurant_num) {
		this.restaurant_num = restaurant_num;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getRation() {
		return ration;
	}

	public void setRation(int ration) {
		this.ration = ration;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	
	

}
