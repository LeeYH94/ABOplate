package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberBean;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberJoinOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		MemberDAO mDao=new MemberDAO();
		MemberBean member=new MemberBean();
		HttpSession session = request.getSession();
		
		ActionForward forward=new ActionForward();
		boolean check=false;
		
		if(session.getAttribute("snsId") != null) {
			//sns 회원가입
			member.setMember_id(session.getAttribute("snsId").toString());
			member.setMember_nickname(mDao.createRandomPw());
		} else {
			member.setMember_id(request.getParameter("member_id"));
			member.setMember_email(request.getParameter("member_email"));
			member.setMember_password(request.getParameter("member_password"));
			member.setMember_nickname(request.getParameter("member_nickname"));
			member.setMember_preference_food(request.getParameter("member_preference_food"));
			member.setMember_region(request.getParameter("member_region"));
		}
		check=mDao.join(member);
		if(!check) {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('다시 시도해주세요.');");
			out.println("</script>");
			out.close();
		}
		
		forward.setRedirect(true);
		//메인페이지로 이동
		return forward;
	}
}