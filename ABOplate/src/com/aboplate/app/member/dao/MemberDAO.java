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

		if((Integer)sqlsession.selectOne("Member.checkEmail", email) == 1) {
			check = true;
		}
		return check;
	}

	public boolean recommendStamp(String id) {
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


	
}
	

	
