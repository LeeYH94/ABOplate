package com.aboplate.app.restaurant.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.mybatis.config.SqlMapConfig;

public class ReviewDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public ReviewDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	
	public List<ReviewBean> getReviewList(int startRow, int endRow, int restaurantNum) {
		
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("restaurantNum", restaurantNum);
		
		List<ReviewBean> reviewList = sqlsession.selectList("Review.getReviwList", datas);
		
		return reviewList;
		
	}
	
	public int getReviewCnt(int restaurantNum) {
		
		return sqlsession.selectOne("Review.getReviewCnt", restaurantNum);
	}
	
	public void deleteOneReview(int reviewNum) {
		sqlsession.delete("Review.deleteOneReview", reviewNum);
	}
	
	public boolean insertReview(ReviewBean reviewBean) {
		boolean check = false;
		
		if(sqlsession.insert("Review.insertReview", reviewBean) == 1) {
			check = true;
		}
		return check;
	}
	
	public boolean checkReviewRecommend(String id, int reviewNum) {
		boolean check = false;
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("id", id);
		datas.put("reviewNum", reviewNum);
		if((Integer)sqlsession.selectOne("Review.checkReviewRecommend", datas) == 1) {
			check = true;
		}
		return check;
	}
	
	public void popReviewRecommend(String id, int reviewNum) {
		HashMap<String, Object> datas = new HashMap<>();
		sqlsession.delete("Review.popReviewRecommend", datas);
	}
	
	public void addReviewRecommend(String id, int reviewNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		
		datas.put("id", id);
		datas.put("reviewNum", reviewNum);
		sqlsession.insert("Review.addReviewRecommend", datas);
	}
	
}
