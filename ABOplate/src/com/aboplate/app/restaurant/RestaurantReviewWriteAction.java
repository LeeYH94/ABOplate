package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;


public class RestaurantReviewWriteAction implements Action{
	public static boolean check = false;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		RestaurantBean restaurantBean = new RestaurantBean();

		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));

		RestaurantDAO restaurantDao = new RestaurantDAO();
		restaurantBean = restaurantDao.getRestaurantInfo(restaurantNum);


		request.setAttribute("restauranNum", restaurantNum);
		request.setAttribute("restaurantBean", restaurantBean);

		forward.setRedirect(false);
		forward.setPath("/restaurant/ReviewWrite.jsp");
		return forward;
	}
}
