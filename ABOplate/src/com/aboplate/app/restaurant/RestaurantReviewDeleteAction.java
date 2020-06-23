package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class RestaurantReviewDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		ReviewDAO reviewDao = new ReviewDAO();
		ActionForward forward = new ActionForward();
		int review_num = Integer.parseInt(request.getParameter("reviewNum"));
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		reviewDao.deleteOneReview(review_num);
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/restaruant/RestarunatView.re?seq=\"+ restaurantNum");
		
		return forward;
	}
}