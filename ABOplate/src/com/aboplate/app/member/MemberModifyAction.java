package com.aboplate.app.member;

import java.io.PrintWriter;

/*import java.io.PrintWriter;*/

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
		
		ActionForward forward = new ActionForward();
		MemberDAO mDao = new MemberDAO();
		MemberBean memberBean =new MemberBean();
		HttpSession session = request.getSession();
		
		String[] preference_en = {"korean", "chinese", "japanese", "american"};
		String[] preference_kor = {"한식,", "중식,", "일식,", "양식,"};
		System.out.println("modify들어옴");
		
		String memberId = (String)session.getAttribute("sessionId");
		memberBean = mDao.getMemberInfo(memberId);
		request.setAttribute("memberBean", memberBean);
		
		String pref = "";
		String mpref = memberBean.getMember_preference_food();
		
		if(mpref!="") {		
			for (int i = 0; i < preference_kor.length; i++) {
				if (mpref.equals(preference_kor[i])) {
					mpref = preference_en[i];	
				}
			}
		}
		request.setAttribute("mpref", mpref);
		
		forward.setRedirect(false);
		forward.setPath("/member/InformationModify.jsp");
		
		return forward;
	}

}
