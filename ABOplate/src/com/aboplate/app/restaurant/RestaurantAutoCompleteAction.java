package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantAutoCompleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		RestaurantDAO restaurantDao = new RestaurantDAO();
		
		String filter = request.getParameter("filter");
		PrintWriter out = response.getWriter();
		
		if (filter.equals("food_category")) {
			out.println(restaurantDao.getFoodCategoryList().toString());			
		} else if (filter.equals("address")) {
			out.println(restaurantDao.getAddressList().toString());						
		} else if (filter.equals("best_restaurant")) {
			out.println(restaurantDao.getBestRestaurantList().toString());									
		} else {
			out.println(restaurantDao.getName().toString());												
		}
		
		return null;
	}
}
