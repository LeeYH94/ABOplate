package com.aboplate.app.restaurant.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.mybatis.config.SqlMapConfig;

public class RestaurantDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public RestaurantDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
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
	
	
	
	
	

}
