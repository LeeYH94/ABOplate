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
		MemberDAO m_dao=new MemberDAO();
		HttpSession session=request.getSession();
		
		String id=request.getParameter("member_id");
		String pw=request.getParameter("member_password");
		
		Map<String, String> resultMap=m_dao.login(id, pw);
		if(resultMap!=null) {
			session.setAttribute("session_id", resultMap.get("MEMBER_ID"));
			//로그인성공후 이동할 페이지
		}else {
			
			forward.setPath(request.getContextPath()+"/member/MemberLogin.me?login=false");
		}
		forward.setRedirect(true);
		return forward;
	}
}
