package com.aboplate.app.restaurant;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;

public class RestaruantCategoryListAction implements Action{
	
//DB검색
	//atrivvute
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String category = request.getParameter(listName);
		if (category=Menu) {
			
		}
		else if(category=Restaruant) {
			
		}
		else if (category= LocalMony) {
			
		}
		
		return null;
	}
	

}
