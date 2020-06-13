package com.aboplate.app.bookmark.dao;

public class BookmarkBean {
	private int bookmark_num;
	private String member_email;
	private int restaurant_num;
	
	public BookmarkBean() {;}

	public int getBookmark_num() {
		return bookmark_num;
	}

	public void setBookmark_num(int bookmark_num) {
		this.bookmark_num = bookmark_num;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getRestaurant_num() {
		return restaurant_num;
	}

	public void setRestaurant_num(int restaurant_num) {
		this.restaurant_num = restaurant_num;
	}
}
