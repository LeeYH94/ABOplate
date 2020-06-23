package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class RestaurantViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		RestaurantDAO restaurantDao = new RestaurantDAO();
		RestaurantBean restaurantBean = new RestaurantBean();
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("sessionId").toString();
		
		ReviewDAO reviewDao = new ReviewDAO();
		
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int pageSize = 5;
		int totalCnt = reviewDao.getReviewCnt(restaurantNum);
		
		int endRow = page * 5;
		int startRow = page - 4;
		
		int startPage = ((page-1) / pageSize) * pageSize + 1;
		int endPage = startPage + 4;
		int totalPage = (totalCnt-1) / pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
		restaurantBean = restaurantDao.getRestaurantInfo(restaurantNum);
		
		request.setAttribute("restaurantBean", restaurantBean);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("currentPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("reviewList", reviewDao.getReviewList(startRow, endRow, restaurantNum));
		request.setAttribute("bookmark", restaurantDao.checkBookmark(id, restaurantNum));
		
		forward.setRedirect(false);
		forward.setPath("/app/restaurant/storeInfo.jsp");
		return forward;
	}
	
}
