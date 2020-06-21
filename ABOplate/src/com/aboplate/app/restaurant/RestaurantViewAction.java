package com.aboplate.app.restaurant;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		RestaurantDAO rDao = new RestaurantDAO();
		RestaurantBean rBean = new RestaurantBean();
		int restaurant_num = Integer.parseInt(request.getParameter("seq"));
		
		List<RestaurantBean> rBeanList = rDao.getDetail(restaurant_num);
		if(rBeanList != null) {
			request.setAttribute("restaurantBeanList", rBeanList);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/member/RestaurantView.jsp");
		return forward;
	}
	
}
