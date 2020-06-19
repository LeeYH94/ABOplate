package com.aboplate.app.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;


public class MemberLoginOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward=new ActionForward();
		MemberDAO mDao=new MemberDAO();
		HttpSession session=request.getSession();
		
		String id=request.getParameter("member_id");
		String pw=request.getParameter("member_password");
		
		Map<String, String> resultMap=mDao.login(id, pw);
		if(resultMap!=null) {
			session.setAttribute("session_id", resultMap.get("MEMBER_ID"));
			//
		}else {
			
			forward.setPath(request.getContextPath()+"/member/MemberLogin.me?login=false");
		}
		forward.setRedirect(true);
		return forward;
	}
}
