package com.aboplate.app.restaurant;

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
		ActionForward forward = new ActionForward();
		
		RestaurantDAO rDao = new RestaurantDAO();
		RestaurantBean rBean = new RestaurantBean();
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		
		rBean = rDao.getRestaurantInfo(restaurantNum);
		
		request.setAttribute("restaurantBean", rBean);
		
		forward.setRedirect(false);
		forward.setPath("/app/restaurant/storeInfo.jsp");
		return forward;
	}
	
}
