package com.aboplate.app.restaurant;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaruantRecommendAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		RestaurantDAO rDao = new RestaurantDAO();
		MemberBean mBean = new MemberBean();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String session_id = (String) session.getAttribute("session_id");

		List<RestaurantBean> restaruantBeanList = rDao.getMemberChoiceList(session_id);

		if (restaruantBeanList != null) {
			request.setAttribute("restaruantBeanList", restaruantBeanList);

			forward.setRedirect(false);
			forward.setPath("/app/member/main2.jsp");
			return forward;

		}
		return null;

	}
}
