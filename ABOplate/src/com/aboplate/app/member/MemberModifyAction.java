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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		MemberDAO mDao = new MemberDAO();
		MemberBean member =new MemberBean();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		//占쏙옙橘占싫� 占쏙옙占쏙옙
		if(request.getParameter("memberPassword")!=null) {
			
		String id = session.getAttribute("sessionId").toString();
		String Password = mDao.encryptPw((request.getParameter("memberPassword")));
		String SessionPassword = session.getAttribute("Password").toString();
		String newPassword = request.getParameter("newMemberPassword");
		//占쏙옙占실븝옙橘占싫ｏ옙占� 占쏙옙占쏙옙 占쏙옙橘占싫ｏ옙占� 占쏙옙占쏙옙占쏙옙 update 占쏙옙占쏙옙  占쌕몌옙占쏙옙 占싫듸옙 
		if(SessionPassword.equals(Password)) {
			mDao.updatePw(newPassword, id);
			session.setAttribute("newPassword", newPassword);
			System.out.println("update-ok");
		}
		else {
			System.out.println("not-ok");
		}
		//占쏙옙호占쏙옙占쏙옙 占쏙옙占쏙옙
		}/*else if(request.getParameter("memberFavorite")!=null) {
			String pref = "";
			for (String favorite : request.getParameterValues("memberFavorite")) {				
				pref = favorite + ",";
			}
			member.setMember_preference_food(pref);
		}*/
		else if(request.getParameter("memberFavorite")!=null) {
			
			out.print("<hteml><body>");
			String favorite[] = request.getParameterValues("memberFavorite");
			System.out.println("당신이 선택한 항목입니다.");
			for(String memberFavorite:favorite) {
				out.println(favorite+" ");
				member.setMember_preference_food(request.getParameter("memberFavorite"));
			}
			out.println("</body></html>");
			out.close();
		}
		//占쏙옙占쏙옙占쏙옙占쏙옙 
		else if(request.getParameter("memberRegion")!=null) {
			//jsp에서 받을 값 변수 선언 
			String region = request.getParameter("memberRegion");
			String regions[] = request.getParameterValues("region");
			
			out.print("<html><body>");
			out.println("회원님이 선택한 지역 : <b>");
			
			out.println(region);
			for(String selectregion:regions) {
				out.print(regions+" ");
				member.setMember_region(request.getParameter("memberRegion"));
			}
			out.print("</body></html>");
			out.close();
			
		}
		
		forward.setPath("/member/main.jsp");
		forward.setRedirect(true);
		return forward;
	}

}
