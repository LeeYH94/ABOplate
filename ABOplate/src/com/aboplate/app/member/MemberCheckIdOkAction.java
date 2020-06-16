package com.aboplate.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;


public class MemberCheckIdOkAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO memberDao = new MemberDAO();
		//����ڰ� �Է��� ��.
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		if(memberDao.checkId(id)) {
			//�ߺ� -not ok
			out.println("not-ok");
		}else {
			//ok
			out.println("ok");
		}
		out.close();
		return null;
	}
}
