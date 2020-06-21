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
			// sns 회원가입
			member.setMember_id(session.getAttribute("snsId").toString());
			member.setMember_nickname(mDao.createRandomPw());
			
			mDao.joinSns(member.getMember_id());
		} else {
			member.setMember_id(request.getParameter("memberId"));
			member.setMember_name(request.getParameter("memberName"));
			member.setMember_email(request.getParameter("memberEmail"));
			member.setMember_password(mDao.encryptPw(request.getParameter("memberPassword")));
			member.setMember_nickname(request.getParameter("memberNickname"));
			member.setMember_preference_food(request.getParameter("memberFavorite"));
			member.setMember_age_group(Integer.parseInt(request.getParameter("memberAge")));
			member.setMember_region(request.getParameter("memberRegion"));
			check=mDao.join(member);
		}
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
