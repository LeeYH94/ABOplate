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
}
