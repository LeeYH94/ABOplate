package com.aboplate.app.member;

import java.io.PrintWriter;

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
		MemberBean member =new MemberBean();
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		//비밀번호 수정
		if(request.getParameter("memberPassword")!=null) {
			
		String id = session.getAttribute("sessionId").toString();
		String Password = mDao.encryptPw((request.getParameter("memberPassword")));
		String SessionPassword = session.getAttribute("Password").toString();
		String newPassword = request.getParameter("newMemberPassword");
		//세션비밀번호와 현재 비밀번호가 같으면 update 가능  다르면 안됨 
		if(SessionPassword.equals(Password)) {
			mDao.updatePw(newPassword, id);
			session.setAttribute("newPassword", newPassword);
			System.out.println("update-ok");
		}
		else {
			System.out.println("not-ok");
		}
		//선호음식 수정
		}else if(request.getParameter("memberFavorite")!=null) {
			String pref = "";
			for (String favorite : request.getParameterValues("memberFavorite")) {				
				pref = favorite + ",";
			}
			member.setMember_preference_food(pref);
		}
		//지역수정 
		else if(request.getParameter("memberRegion")!=null) {
			member.setMember_region(request.getParameter("memberRegion"));
		}
		
		forward.setPath("/member/main.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
