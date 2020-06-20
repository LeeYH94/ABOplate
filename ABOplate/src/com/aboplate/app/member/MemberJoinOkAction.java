package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(1);
		ActionForward forward=new ActionForward();
		boolean check=false;
		
		if(request.getParameter("kakaoId") != null) {
			System.out.println(2);
			// 카카오 아이디가 DB에 있다면 세션에 담아서 메인 페이지로 이동
			// 카카오 아이디가 DB에 없다면 회원가입
		} else if (request.getParameter("googleId") != null) {
			//카카오랑 같음
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
