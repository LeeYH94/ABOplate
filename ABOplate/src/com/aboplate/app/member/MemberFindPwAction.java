package com.aboplate.app.member;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;

public class MemberFindPwAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		MemberDAO memberDao = new MemberDAO();
		
		String id = request.getParameter("member_id");
		String email = request.getParameter("member_email");
		
		
		String newPw = memberDao.randomPw(10);
		PrintWriter out = response.getWriter();
		if(memberDao.updatePw(newPw, id)) {
			//���ο� ��й�ȣ ����� �̸��Ϸ� �����ϴ� �ڵ��ۼ��ϱ�
			memberDao.sendMail(email, newPw);
		}else {
			out.println("<script>");
			out.println("alert('�ٽ� �õ����ּ���');");
			out.println("</script>");
			out.close();
		}
		forward.setRedirect(true);
		//로그인 페이지로 이동
		return forward;
	}
}