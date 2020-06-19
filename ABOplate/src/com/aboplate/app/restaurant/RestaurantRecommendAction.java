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
		RestaurantDAO r_dao = new RestaurantDAO();
		RestaurantBean r_bean = new RestaurantBean();
		
		//r_dao���� �޼ҵ�� �������� 
		r_bean = r_dao.getPopularList(restaurant_num);
		//�����ؾ���
		List<RestaurantBean> restaurantBeanList = r_dao.getPopularList(restaurant_num);
		
		if(r_bean !=null) {
			request.setAttribute("restaurantBeanList", restaurantBeanList);
			if( restaurantBeanList!=null) {
				request.setAttribute(" restaurantBeanList", restaurantBeanList);
			}
			ActionForward forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/main2.jsp");
			return forward;
		}
		double randomValue = Math.random();
		int ran = (int)(randomValue * 8)-1;
		RestaurantBean getValue = restaurantBeanList.get(ran);
		restaurantBeanList.remove(ran);
		
		return null;
	}

}
