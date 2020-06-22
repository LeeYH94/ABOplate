package com.aboplate.app.restaurant;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantPopularAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		RestaurantDAO r_dao = new RestaurantDAO();
		ActionForward forward = new ActionForward();
		RestaurantBean r_bean;
		
		//�����ؾ���
		List<RestaurantBean> restaurantBeanList = r_dao.getPopularList();
		ArrayList<RestaurantBean> popularList = new ArrayList<>();
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
		if(popularList!=null) {
			request.setAttribute("popularList",popularList);
			forward.setPath(request.getContextPath()+"/app/index.jsp");
			
		}
		forward.setRedirect(true);
		return forward;
	}
}
