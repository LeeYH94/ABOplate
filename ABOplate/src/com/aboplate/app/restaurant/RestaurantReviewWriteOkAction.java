package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
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
		
		ActionForward forward = new ActionForward();
		
		int restaurant_num = Integer.parseInt(request.getParameter("seq"));
		String member_id = (String)session.getAttribute("session_id");
		String review = request.getParameter("review");
		
		String saveFolder = "";
		int fileSize = 5 * 1024 * 1024;	//5M
		
		boolean reviewResult = false;
		boolean pictureResult = false;

		try {
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			
			reviewBean.setReview(multi.getParameter("review"));
			reviewResult = reviewDao.insertReview(reviewBean);
			
			int reviewNum = Integer.parseInt(multi.getParameter("seq"));
			pictureResult = pictureDao.insertFiles(multi,reviewNum);
			
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
			forward.setPath(request.getContextPath() + "/restaurant/storeInfo.jsp");
			return forward;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

}
