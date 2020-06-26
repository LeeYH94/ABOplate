package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;
import com.aboplate.app.picture.dao.PictureDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RestaurantReviewWriteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		ReviewDAO reviewDao = new ReviewDAO();
		ReviewBean reviewBean = new ReviewBean();
		PictureDAO pictureDao = new PictureDAO();
		HttpSession session = request.getSession();
		MemberDAO memberDao = new MemberDAO();
		
		ActionForward forward = new ActionForward();
		
		int restaurantNum = Integer.parseInt(request.getParameter("restaurantNum"));
		String memberId = (String)session.getAttribute("sessionId");
		String starRating = request.getParameter("starRating");
		
		String nickName = memberDao.getMemberNickname(memberId);
		
		String saveFolder = "";
		int fileSize = 5 * 1024 * 1024;	//5M
		
		boolean reviewResult = false;
		boolean pictureResult = false;

		try {
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			
			reviewBean.setReview(multi.getParameter("review"));
			reviewBean.setNickname(nickName);
			reviewResult = reviewDao.insertReview(reviewBean);
			
			pictureResult = pictureDao.insertFiles(multi, reviewDao.getReviewSeq());
			
			if(!reviewResult || !pictureResult) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('리뷰 등록 실패. 다시 시도해주세요.');");
				out.println("</script>");
				out.close();
				return null;
			}
			forward.setRedirect(true);
			forward.setPath(request.getContextPath() + "/restaurant/restaurantView.re?restaurantNum=" + restaurantNum);
			return forward;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}
