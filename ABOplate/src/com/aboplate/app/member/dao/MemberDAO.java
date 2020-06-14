package com.aboplate.app.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.mybatis.config.SqlMapConfig;


public class MemberDAO {
	SqlSessionFactory sessionf=SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public MemberDAO() {
		sqlsession=sessionf.openSession(true);
	}
	public boolean join(MemberBean member) {
		boolean check=false;
		if(sqlsession.insert("Member.join",member)==1) {
			check=true;
		}
		return check;
	}
	public Map<String, String> login(String id,String pw) {
	
		HashMap<String, String> datas=new HashMap<>();
		datas.put("id", id);
		datas.put("pw", pw);
		Map<String, String>loginDatas=sqlsession.selectOne("Member.login",datas);
		
		return loginDatas;
	}

}