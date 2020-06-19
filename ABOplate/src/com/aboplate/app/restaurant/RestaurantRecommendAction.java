package com.aboplate.app.restaurant;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantRecommendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		RestaurantDAO r_dao = new RestaurantDAO();
		RestaurantBean r_bean;
		
		//�����ؾ���
		List<RestaurantBean> restaurantBeanList = r_dao.getPopularList();
		List<RestaurantBean> popularList = new List<>();
		int popularListLength = restaurantBeanList.size();
		
		
		double randomValue = Math.random()*popularListLength;
		while(popularList.size()<8) {
			r_bean = restaurantBeanList.get((int)randomValue);
			if(popularList.contains(r_bean)) {
				continue;
			}else {
				popularList.add(r_bean);
			}
		}
	
		
		return null;
	}
}
