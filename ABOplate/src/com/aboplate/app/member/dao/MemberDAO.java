package com.aboplate.app.member.dao;

import java.util.HashMap;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.mybatis.config.SqlMapConfig;


public class MemberDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public MemberDAO() {
		sqlsession = sessionf.openSession(true);
	}

	public boolean join(MemberBean member) {
		boolean check = false;
		if (sqlsession.insert("Member.join", member) == 1) {
			check = true;
		}
		return check;
	}
	public Map<String, String> login(String id, String pw) {

		HashMap<String, String> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("pw", pw);
		Map<String, String> loginDatas = sqlsession.selectOne("Member.login", datas);

		return loginDatas;
	}

	public String findId(String email, String name) {
		HashMap<String, String> datas = new HashMap<>();

		datas.put("email", email);
		datas.put("name", name);

		String member_id = sqlsession.selectOne("Member.findId", datas);

		return member_id;
	}

	public boolean updatePw(String newPw, String id) {
		boolean check = false;
		HashMap<String, String> datas = new HashMap<>();

		datas.put("newPw", newPw);
		datas.put("id", id);

		if (sqlsession.update("Member.updatePw", datas) == 1) {
			check = true;
		}
		return check;
	}

	
	
	public boolean checkEmail(String email) {
		boolean check = false;
		
		if((Integer)sqlsession.selectOne("Member.checkId", email) == 1) {
			check = true;
		}
		return check;
	}
	
	public boolean updateStamp(String id) {
		boolean check = false;
		
		if(checkId(id)) {
			sqlsession.update("Member.updateStamp", id);
			check = true;
		}
		return check;
	}
	
	public boolean checkId(String id) {
		boolean check = false;
		if((Integer)sqlsession.selectOne("Member.checkId", id) == 1) {
			check = true;
		}
		return check;
	}
	
	
	//�ӽú�й�ȣ ����
	public static String randomPw (int length) {
		int index = 0;
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
	
	// ���� �߼� �޼ҵ�
		public void sendMail(String email, String newPw) throws AddressException, MessagingException {
			String host = "smtp.naver.com";

			// --- �ȿ� ������ ��� �̸��� �ּ�(@naver.com)����, ��й�ȣ
			final String id = "yhya0904";
			final String pw = "leeheader7679!";
			int port = 465;

			String recipient = email;
			String subject = "���� �߼� Ȯ��";
			

			Properties props = System.getProperties();

			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String userName = id;
				String passWord = pw;

				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(userName, passWord);
				}
			});
			session.setDebug(true);

			Message mimeMessage = new MimeMessage(session);
			// --- �ȿ� ������ ��� �̸��� �ּ� �ֱ� (@naver.com) ����
			mimeMessage.setFrom(new InternetAddress("yhya0904@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			mimeMessage.setSubject(subject);
			mimeMessage.setText(newPw);
			Transport.send(mimeMessage);
		}
	}











