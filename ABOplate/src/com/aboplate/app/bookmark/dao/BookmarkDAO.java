package com.aboplate.app.bookmark.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.aboplate.app.restaurant.dao.RestaurantBean;
import com.aboplate.mybatis.config.SqlMapConfig;

public class BookmarkDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BookmarkDAO() {
		sqlsession = sessionf.openSession(true);
	}
	
	public List<RestaurantBean> getBookmarkList(int startRow, int endRow, String sessionId) {
		
		HashMap<String , Object> datas = new HashMap<>();
		
		List<Integer> restaurantNumList = sqlsession.selectList("Bookmark.getRestaurantNumList", sessionId);
		System.out.println(restaurantNumList.get(0));
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		
		
		List<RestaurantBean> bookmarkList = new ArrayList<>();
		
		for (int i = 0; i < restaurantNumList.size(); i++) {
			datas.put("restaurantNum", restaurantNumList.get(i));
			bookmarkList.add((RestaurantBean) sqlsession.selectOne("Bookmark.getBookmarkList", datas));
			
		}
		
		/*for(int restaurantNum : restaurantNumList) {
			bookmarkList.add(sqlsession.selectOne("Bookmark.getBookmarkList", startRow, endRow, restaurantNum));
			
		}
			*/
		
		return bookmarkList;
		
	}
	
	public int checkBookmark(String id, int restaurantNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("restaurantNum", restaurantNum);
		
		return sqlsession.selectOne("Bookmark.checkBookmark", datas);
	}
	
	public void popBookmark(String id, int restaurantNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("restaurantNum", restaurantNum);
		
		sqlsession.delete("Bookmark.popBookmark", datas);
	}
	
	public void addBookmark(String id, int restaurantNum) {
		
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("id", id);
		datas.put("restaurantNum", restaurantNum);
		
		sqlsession.insert("Bookmark.addBookmark", datas);
	}
	
	public int getBookmarkCnt(String memberId) {
		
		return sqlsession.selectOne("Bookmark.getBookmarkCnt", memberId);
	}
}


















