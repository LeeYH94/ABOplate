package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;



public class MemberFindIdAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		MemberDAO memberDao = new MemberDAO();
		String email = request.getParameter("member_email");
		String name = request.getParameter("member_nickname");
		PrintWriter out = response.getWriter();
		
		String id = memberDao.findId(email, name);
		if(id!=null) {
			response.setContentType("text/html; charset=UTF-8");
			out.println("<script>");
			out.println("alert('당신의 아이디는'+id+'입니다.');");
			out.println("</script>");
			out.close();
		}else {
			out.println("<script>");
			out.println("alert('아이디가 존재하지않습니다.');");
			out.println("</script>");
			out.close();
		}
		forward.setRedirect(true);
		//로그인페이지 넣기.
		return forward;
	}
}
