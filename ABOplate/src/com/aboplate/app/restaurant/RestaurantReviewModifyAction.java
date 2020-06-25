package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class RestaurantReviewModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		ReviewDAO reviewDao = new ReviewDAO();
		ReviewBean reviewBean = new ReviewBean();
		
		int reviewNum = Integer.parseInt(request.getParameter("seq"));
		reviewBean = reviewDao.getReviewDetail(reviewNum);
		request.setAttribute("reviewBean", reviewBean);
		
		
		forward.setRedirect(false);
		forward.setPath("/app/restaurant/ReviewPage.jsp");
		return forward;
	}

}
