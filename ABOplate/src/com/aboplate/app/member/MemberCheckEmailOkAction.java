package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberCheckEmailOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO mDao = new MemberDAO();
		String email = request.getParameter("member_email");
		PrintWriter out = response.getWriter();
		
		if(mDao.checkEmail(email)) {
			//중복된 이메일입니다.
			out.println("not-ok");
		}else {
			//사용할 수 있는 이메일입니다.
			out.println("ok");
		}
		return null;
	}
}
