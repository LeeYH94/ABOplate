package com.aboplate.app.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import com.aboplate.app.member.dao.MemberDAO;


public class MemberLoginOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward=new ActionForward();
		MemberDAO mDao=new MemberDAO();
		HttpSession session=request.getSession();
		
		if(request.getParameter("kakaoId") != null) {
			System.out.println(2);
			String kakaoId = request.getParameter("kakaoId");
			session.setAttribute("sessionId", kakaoId);
			
			// db에 있는지 검사하는 메소드 사용
			if(mDao.checkId(kakaoId)) {
				// 카카오 아이디가 DB에 있다면 세션에 담아서 메인 페이지로 이동
				// 이건 단순 이동
				forward.setPath(request.getContextPath() + "../index.jsp");
			} else {
				// 없다면 session_id에 담아서 join.me로 이동
				forward.setPath(request.getContextPath() + "/member/MemberJoin.me");
			}
		} else if (request.getParameter("googleId") != null) {
			//카카오랑 같음
			System.out.println("3");
			String googleId = request.getParameter("googleId");
			session.setAttribute("sessionId", googleId);
			
			// db에 있는지 검사하는 메소드 사용
			if(mDao.checkId(googleId)) {
				// 카카오 아이디가 DB에 있다면 세션에 담아서 메인 페이지로 이동
				// 이건 단순 이동
				forward.setPath(request.getContextPath() + "../index.jsp");
			} else {
				// 없다면 session_id에 담아서 join.me로 이동
				forward.setPath(request.getContextPath() + "/member/MemberJoin.me");
			}
		}else {
			System.out.println("2");
			String id=request.getParameter("memberId");
			String pw=mDao.encryptPw((request.getParameter("memberPassword")));
			
	
			Map<String, String> resultMap=mDao.login(id, pw);
			
			
			if(resultMap!=null) {
				session.setAttribute("sessionId", resultMap.get("MEMBER_ID"));
				forward.setPath(request.getContextPath()+"/index.jsp");	
			}else {
				forward.setPath(request.getContextPath()+"/member/MemberLogin.me?login=false");
			}
		}
		forward.setRedirect(true);
		return forward;
	}
}
