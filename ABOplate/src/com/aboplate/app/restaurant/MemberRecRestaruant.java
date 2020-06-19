package com.aboplate.app.restaurant;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class MemberRecRestaruant implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		RestaurantDAO rDao = new RestaurantDAO();
		MemberBean mBean = new MemberBean();
		ActionForward forward = new ActionForward();
		
		String food = request.getParameter("member_preference_food");
		int age_group = Integer.parseInt(request.getParameter("member_age_group"));
		String region = request.getParameter("member_region");
		List<MemberBean> memberBeanList = rDao.getBestMemberRestaurantList(food,age_group,region);
		
		if(rDao.memberRecommend(food, age_group, region)) {
			//추천리스트목록 띄워주기
			if(memberBeanList!=null) {
				request.setAttribute("memberBeanList", memberBeanList);
			}
		
			forward.setRedirect(false);
			//맛집 추천후 이동할 페이지
			return forward;
		}
		return null;
	}
}
