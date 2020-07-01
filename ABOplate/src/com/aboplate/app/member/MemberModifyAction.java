package com.aboplate.app.member;

import java.io.PrintWriter;

/*import java.io.PrintWriter;*/

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		MemberDAO mDao = new MemberDAO();
		MemberBean memberBean =new MemberBean();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		System.out.println("modify들어옴");
		
		String memberId = (String)session.getAttribute("sessionId");
		String memberNickname =  mDao.getMemberNickname(memberId);
		String Password = mDao.encryptPw((request.getParameter("memberPassword")));
		
		memberBean = mDao.getMemberInfo(memberId);
		request.setAttribute("memberBean", memberBean);
		request.setAttribute("memberNickname",memberNickname);
		System.out.println(memberNickname);
		request.setAttribute("memberPassword",Password);
	
		forward.setRedirect(false);
		forward.setPath("/member/Informationmodify.jsp");
		
		return forward;
	}

}
