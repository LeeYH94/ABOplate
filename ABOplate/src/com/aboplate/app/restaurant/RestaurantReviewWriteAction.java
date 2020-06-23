package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;

public class RestaurantReviewWriteAction implements Action{
	public static boolean check = false;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		ReviewDAO reviewDao = new ReviewDAO();
		ReviewBean reviewBean = new ReviewBean();
		
		int restaurant_num = Integer.parseInt(request.getParameter("restaurantNum"));
		String nickname = request.getParameter("nickname");
		String review = request.getParameter("review");
		int ration = Integer.parseInt(request.getParameter("ration"));
		String report = request.getParameter("report");
		String upload_date = request.getParameter("upload_date");
		
		if(!check) {
			reviewBean.setRestaurant_num(restaurant_num);
			reviewBean.setNickname(nickname);
			reviewBean.setReview(review);
			reviewBean.setRation(ration);
			reviewBean.setReport(report);
			reviewBean.setUpload_date(upload_date);
			
			check = true;
			if(reviewDao.insertReview(reviewBean)) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(request.getContextPath() + "/restaurant/RestaurantView.re?seq="+restaurant_num);
			}
		}else {
			PrintWriter out = response.getWriter();
			response.setContentType("text/html;charset=utf-8");
			out.println("<script>");
			out.println("alert('기다려주세요'); history.back();");
			out.println("</script>");
			out.close();
			}
		return forward;
	}
}
