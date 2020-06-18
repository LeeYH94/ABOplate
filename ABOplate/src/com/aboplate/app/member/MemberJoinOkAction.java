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
		MemberDAO m_dao=new MemberDAO();
		MemberBean member=new MemberBean();
		
		ActionForward forward=new ActionForward();
		boolean check=false;
		
		member.setMember_id(request.getParameter("member_id"));
		member.setMember_email(request.getParameter("member_email"));
		member.setMember_password(request.getParameter("member_password"));
		member.setMember_nickname(request.getParameter("member_nickname"));
		member.setMember_preference_food(request.getParameter("member_preference_food"));
		member.setMember_region(request.getParameter("member_region"));
		
		check=m_dao.join(member);
		if(!check) {
			PrintWriter out=response.getWriter();
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙. 占쏙옙占� 占쏙옙 占쌕쏙옙 占시듸옙占쏙옙占쌍쇽옙占쏙옙.');");
			out.println("</script>");
			out.close();
		}
		
		forward.setRedirect(true);
		//회占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍깍옙.
		return forward;
	}
}
