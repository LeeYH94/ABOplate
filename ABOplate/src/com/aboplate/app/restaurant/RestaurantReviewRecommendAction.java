package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;

public class RestaurantReviewRecommendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		RestaurantDAO restaurantDao = new RestaurantDAO();
		
		String id = session.getAttribute("sessionId").toString();
		int reviewNum = (int) request.getAttribute("reviewNum");
		
		PrintWriter out = response.getWriter();
		
		if(restaurantDao.checkReviewRecommend(id, reviewNum)) {
			restaurantDao.popReviewRecommend(id, reviewNum);
			out.print("pop");
		} else {
			restaurantDao.addReviewRecommend(id, reviewNum);
			out.print("add");
		}
		
		return null;
	}

}
