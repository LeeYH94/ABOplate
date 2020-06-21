package com.aboplate.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import java.util.Properties;



import javax.mail.Authenticator;

import javax.mail.Message;

import javax.mail.PasswordAuthentication;

import javax.mail.Session;

import javax.mail.Transport;

import javax.mail.internet.InternetAddress;

import javax.mail.internet.MimeMessage;


public class MemberSendEmailOkAction implements Action{
	
	
		public String randomPw () {
			int length=6;
			int index = 0;
			String epw;
			char[] charSet = new char[] {
					'0','1','2','3','4','5','6','7','8','9'
					,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O'
					,'P','Q','R','S','T','U','V','W','X','Y','Z'
					,'a','b','c','d','e','f','g','h','i','k','l','m','n','o','p'
					,'q','r','s','t','u','v','w','x','y','z'};
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i<length; i++) {
				index = (int)(charSet.length * Math.random());
				sb.append(charSet[index]);
			}
			return sb.toString();
			}
		
//		public String sendMail () {
//			
//			String mailProtocol = "smtp";
//
//			String mailHost = "smtp.gmail.com";
//
//			String mailPort = "587";
//
//			String mailId = "abc@gmail.com"; // 援ш�怨꾩젙
//
//			String mailPassword = "abc"; // 援ш�怨꾩젙 鍮꾨�踰덊샇 
//
//			
//
//			String fromName = "ABOplate";
//
//			String fromEmail = "aboplate04@gmail.com"; // 蹂대궡�뒗 �궗�엺 硫붿씪
//
//			//String toName = MemberName;
//
//			//String toEmail = MemberEmail; // 諛쏅뒗�궗�엺硫붿씪
//
//			String mailTitle = "�씤利앸쾲�샇";
//
//			String mailContents = "randomPw ()";
//
//			String debugMode = "false";
//
//			String authMode = "true";
//			try {
//
//				
//
//				boolean debug = Boolean.valueOf(debugMode).booleanValue();
//
//
//
//				Properties mailProps = new Properties();
//
//				mailProps.put("mail.smtp.starttls.enable", "true");
//
//				mailProps.setProperty("mail.transport.protocol", mailProtocol); 
//
//				mailProps.put("mail.debug", debugMode);
//
//				mailProps.put("mail.smtp.host", mailHost);
//
//				mailProps.put("mail.smtp.port", mailPort);
//
//				mailProps.put("mail.smtp.connectiontimeout", "5000");
//
//				mailProps.put("mail.smtp.timeout", "5000");  
//
//				mailProps.put("mail.smtp.auth", authMode);
//
//				
//
//				Session msgSession = null;
//
//				if(authMode.equals("true")) {
//
//			        Authenticator auth = new MyAuthentication(mailId, mailPassword);
//
//					msgSession = Session.getInstance(mailProps, auth);
//
//				} else {
//
//					msgSession = Session.getInstance(mailProps, null); 
//
//				}
//
//				
//
//				msgSession.setDebug(debug);
//
//				
//
//				MimeMessage msg = new MimeMessage(msgSession);
//
//				msg.setFrom(new InternetAddress(fromEmail, fromName));
//
//				//msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail, toName));
//
//				msg.setSubject(mailTitle);
//
//				msg.setContent(mailContents, "text/html; charset=euc-kr");
//
//				
//
//				// �뒪�깭�떛�븿�닔濡� 吏곸젒 蹂대궡吏� �븡怨� 媛앹껜瑜� �씠�슜�빐�꽌 蹂대궡怨� 媛앹껜瑜� �떕�븘以��떎. 
//
//				Transport t = msgSession.getTransport(mailProtocol);
//
//				try {
//
//					t.connect();
//
//					t.sendMessage(msg, msg.getAllRecipients());
//
//				} finally {
//
//				  t.close();
//
//				}
//
//		  
//
//			} catch(Exception e) {
//
//				e.printStackTrace();
//
//			}
//
//		}
//


	class MyAuthentication extends Authenticator {

	    PasswordAuthentication pa;

	    public MyAuthentication(String mailId, String mailPass) {

	        pa = new PasswordAuthentication(mailId, mailPass);  

	    }

	    public PasswordAuthentication getPasswordAuthentication() {

	        return pa;


		}
	}
	

		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String epw=randomPw ();
			
			request.setAttribute("getMailPw",epw);
			return null;
		}
	
		
		
		
		
}
