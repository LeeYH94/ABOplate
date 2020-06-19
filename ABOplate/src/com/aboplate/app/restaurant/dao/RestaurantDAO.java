package com.aboplate.app.restaurant.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;
import com.aboplate.mybatis.config.SqlMapConfig;

public class RestaurantDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public RestaurantDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	// 연관검색어 전용 리스트
	public List<String> getName() {
		
		List<String> nameList = sqlsession.selectList("Restaurant.getNameList");
		
		return nameList;
	}
	
	public List<String> getLocalCurrencyList(){
		
		List<String> localCurrencyList = sqlsession.selectList("Restaurant.getLocalCurrencyList");
		
		return localCurrencyList;
	}
	
	public List<String> getFoodCategoryList(){
		
		List<String> foodCategoryList = sqlsession.selectList("Restaurant.getFoodCategoryList");
		
		return foodCategoryList;
	}
	
	public List<String> getAddressList(){
		
		List<String> addressList = sqlsession.selectList("Restaurant.getAddressList");
		
		return addressList;
	}
	
	public List<String> getBestRestaurantList(){
		
		List<String> bestRestaurantList = sqlsession.selectList("Restaurant.getBestRestaurantList");
		
		return bestRestaurantList; 
	}
	// 여기까지 연관검색어
	
	// 회원 맞춤 맛집 추천
	public List<RestaurantBean> getMemberChoiceList(String session_id) {
		
		HashMap<String, Object> datas = new HashMap<>();
		MemberBean memberBean = sqlsession.selectOne("Member.getJoinList", session_id);
		 
		datas.put("category", memberBean.getMember_preference_food());
		datas.put("region", memberBean.getMember_region());
		datas.put("age_group", memberBean.getMember_age_group());
		
		List<RestaurantBean> memberChoicerestaurantList = sqlsession.selectList("Restaurant.getMemberChoiceRestaurantList");
		
		return memberChoicerestaurantList;
	}
		
	public List<RestaurantBean> getPopularList(){
			
		List<RestaurantBean> popularList = sqlsession.selectList("Restaurant.getPopularRestaurant");
			
		return popularList;
	}
	
	public List<RestaurantBean> search(String keyField, String keyWord) {
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("keyField", keyField);
		datas.put("keyWord", keyWord);
		
		List<RestaurantBean> searchList = sqlsession.selectList("Restaurant.searchRestaurant", datas);
		
		return searchList;
	}
		
	
	
	
	
	
	
	
		
		
}


