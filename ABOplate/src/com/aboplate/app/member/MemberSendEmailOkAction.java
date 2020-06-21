package com.aboplate.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aboplate.action.Action;
import com.aboplate.action.ActionForward;
import java.util.Properties;



import javax.mail.Authenticator;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;

import javax.mail.Session;

import javax.mail.Transport;
import javax.mail.internet.AddressException;
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
		
		
		public void sendMail () {
		String epw=randomPw (); 
			 String user = "aboplate04@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		        String password = "asdf1234!@";   // 패스워드
		        

		        // SMTP 서버 정보를 설정한다.
		        Properties prop = new Properties();
		        prop.put("mail.smtp.host", "smtp.gmail.com"); 
		        prop.put("mail.smtp.port", 465); 
		        prop.put("mail.smtp.auth", "true"); 
		        prop.put("mail.smtp.ssl.enable", "true"); 
		        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		        
		        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
		            protected PasswordAuthentication getPasswordAuthentication() {
		                return new PasswordAuthentication(user, password);
		            }
		        });

		        try {
		            MimeMessage message = new MimeMessage(session);
		            message.setFrom(new InternetAddress(user));

		            //수신자메일주소
		            message.addRecipient(Message.RecipientType.TO, new InternetAddress(MemberEmail)); 

		            // Subject
		            message.setSubject("ABOPLATE 인증번호"); //메일 제목을 입력

		            // Text
		            message.setText(epw);    //메일 내용을 입력

		            // send the message
		            Transport.send(message); ////전송
		            System.out.println("message sent successfully...");
		        } catch (AddressException e) {
		         System.out.println("AddressException"+e);
		            e.printStackTrace();
		        } catch (MessagingException e) {
		            System.out.println("printStackTrace"+e);
		            e.printStackTrace();
		        }
		    }




		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String epw=randomPw ();
			
			request.setAttribute("getMailPw",epw);
			return null;
		}
	
		
		
		
		
}
