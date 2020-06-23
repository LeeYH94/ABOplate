package com.aboplate.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberMypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		MemberDAO memberDAO = new MemberDAO();
		MemberBean memberBean = new MemberBean();
		HttpSession session = request.getSession();
		
		String id = session.getAttribute("sessionId").toString();
		memberBean = memberDAO.getMemerInfo(id);
		
		request.setAttribute("memberBean", memberBean);
		forward.setRedirect(true);
		forward.setPath("/member/mypage.jsp");
		return null;
	}

}
