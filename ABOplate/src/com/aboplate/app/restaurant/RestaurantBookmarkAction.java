package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.bookmark.dao.BookmarkBean;
import com.aboplate.app.bookmark.dao.BookmarkDAO;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantBookmarkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		
		RestaurantDAO rDao = new RestaurantDAO();
		BookmarkDAO bookmarkDao = new BookmarkDAO();
		BookmarkBean bookmarkBean = new BookmarkBean();
		int bookmark_num = Integer.parseInt(request.getParameter("bookmarkNum"));
		String email = request.getParameter("member_email");
		
		String temp = request.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		int pageSize = 5;
		int totalCnt = bookmarkDao.getBookmarkCnt(bookmark_num);
		
		int endRow = page * 5;
		int startRow = page - 4;
		
		int startPage = ((page-1)/pageSize) * pageSize + 1;
		int endPage = startPage + 4;
		int totalPage = (totalCnt-1) / pageSize + 1;
		
		endPage = endPage > totalPage ? totalPage : endPage;
	
		
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalCnt", totalCnt);
		request.setAttribute("currentPage", page);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("bookmarkList", bookmarkDao.getBookmarkList(startRow,endRow));
		
		forward.setRedirect(false);
		forward.setPath("/app/bookmark/storeInfo.jsp");
 		return forward;
	}
}























