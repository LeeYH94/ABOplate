package com.aboplate.app.restaurant;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.app.restaurant.dao.RestaurantDAO;

public class RestaurantSearchAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
	
		ActionForward forward = new ActionForward();
		RestaurantDAO r_dao = new RestaurantDAO();
		
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
	
		/*search()만들어 주세요! RestaurantDAO*/
		//TODO
//		List<RestaurantBean> restaurantBeanList = r_dao.search(keyField, keyWord);
		
//		if(restaurantBeanList != null) {
//			request.setAttribute("restaurantBeanList", restaurantBeanList);
//			forward.setPath("/app/restauran/restauranList.jsp");
//		}		
		
		forward.setRedirect(true);
		return forward;
	}

}
