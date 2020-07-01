package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = null;
		MemberDAO mDao = new MemberDAO();
		MemberBean memberBean =new MemberBean();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		System.out.println("memberok들어옴");
		String memberId = (String)session.getAttribute("sessionId");
		System.out.println(memberId);
		String memberNickname =  mDao.getMemberNickname(memberId);
		System.out.println(memberNickname);
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/member/MemberInfo.me");
		
		return forward;
	}

}
