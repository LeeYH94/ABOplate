package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.bookmark.dao.BookmarkDAO;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantBookmarkOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		BookmarkDAO bookmarkDao = new BookmarkDAO();
		
		String id = (String) session.getAttribute("sessionId");
		
		//레스토랑 번호 가져옴
		RestaurantBean restaurantBean = (RestaurantBean) request.getAttribute("restaurantBean");
		int restaurantNum = restaurantBean.getRestaurant_num();
		
		//boolean값으로, DB에 있으면 빼기, DB에 없으면 추가
		if(bookmarkDao.checkBookmark(id, restaurantNum) == 1) {
			bookmarkDao.popBookmark(id, restaurantNum);
		} else {
			bookmarkDao.addBookmark(id, restaurantNum);
		}
		
		return null;
	}

}
