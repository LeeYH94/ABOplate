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
		MemberDAO m_dao=new MemberDAO();
		MemberBean member=new MemberBean();
		
		ActionForward forward=new ActionForward();
		boolean check=false;
		
		member.setMember_id(request.getParameter("member_id"));
		member.setMember_email(request.getParameter("member_email"));
		member.setMember_password(request.getParameter("member_password"));
		member.setMember_nickname(request.getParameter("member_nickname"));
		member.setMember_stamp(Integer.parseInt(request.getParameter("member_stamp")));
		member.setMember_preference_food(request.getParameter("member_preference_food"));
		member.setMember_region(request.getParameter("member_region"));
		member.setMember_age_group(Integer.parseInt(request.getParameter("member_age_group")));
		member.setMember_report(Integer.parseInt(request.getParameter("member_report")));
		member.setMember_last_report(request.getParameter("member_last_report"));
		
		check=m_dao.join(member);
		if(!check) {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('회원가입 실패. 잠시 후 다시 시도해주세요.');");
			out.println("</script>");
			out.close();
		}
		
		forward.setRedirect(true);
		//회원가입후 이동할 페이지 넣기.
		return forward;
	}
}
