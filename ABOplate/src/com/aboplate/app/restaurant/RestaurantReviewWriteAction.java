package com.aboplate.app.restaurant;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;
import com.aboplate.app.picture.dao.PictureDAO;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;
import com.aboplate.app.restaurant.dao.ReviewBean;
import com.aboplate.app.restaurant.dao.ReviewDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RestaurantReviewWriteAction implements Action{
	public static boolean check = false;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		MemberDAO memberDao = new MemberDAO();
		MemberBean memberBean = new MemberBean();
		HttpSession session = request.getSession();
		
		int restauranNum = Integer.parseInt(request.getParameter("seq"));
		String member_id = (String)session.getAttribute("session_id");
		String memberNickname = "";

		memberNickname = memberDao.getMemberNickname(member_id);
		
		request.setAttribute("restauranNum", restauranNum);
		request.setAttribute("memberNickname", memberNickname);
		
		forward.setRedirect(true);
		forward.setPath("/restaurant/ReviewWrite.jsp");
		return forward;
	}
}
