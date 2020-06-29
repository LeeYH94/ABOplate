package com.aboplate.app.picture.dao;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class PictureDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public PictureDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public List<PictureBean> getPictureDetail(int reviewNum){
		
		List<PictureBean> pictureBeanList = sqlsession.selectList("Picture.getPictureDetail", reviewNum);
		return pictureBeanList;
	}
	
	public boolean insertPicture(MultipartRequest multi, int reviewNum) {
		HashMap<String, Object> datas = new HashMap<>();
		Enumeration<String> pictures = multi.getFileNames();
		boolean check = true;
		
		datas.put("reviewNum", reviewNum);
		
		while(pictures.hasMoreElements()) {
			String data = pictures.nextElement();
			if(multi.getFilesystemName(data) == null) {continue;}
			datas.put("picturePath", multi.getFilesystemName(data));
			if(sqlsession.insert("Picture.insertPicture", datas) != 1){
				check = false;
				break;
			}
		}
		return check;
	}
	
	public void deletePicture(int reviewNum) {
		sqlsession.delete("Picture.deletePicture", reviewNum);
	}

}
