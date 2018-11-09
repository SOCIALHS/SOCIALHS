package com.bc.main.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.security.auth.message.callback.SecretKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BoardVO;
import com.bc.mybatis.DBService;

public class BoardSearchDAO {
	private static SqlSession ss;

	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);

		return ss;
	}
	
	public static List<BoardVO> getTitle(String hs, String keyword) {

		Map<String, String> map = new HashMap<>();
		map.put("hs", hs);
		map.put("keyword", keyword);
		
		System.out.println("getTitle map : " + map);
		List<BoardVO> t_list = getSql().selectList("search.title", map);
		return t_list;
	}
	
	public static List<BoardVO> getId(String hs, String keyword){
		Map<String, String> map = new HashMap<>();
		map.put("hs", hs);
		map.put("keyword", keyword);
		
		System.out.println("getId map : " + map);
		List<BoardVO> i_list =  getSql().selectList("search.id", map);
		return i_list;
	}
	
	public static List<BoardVO> getContent(String hs, String keyword){
		Map<String, String> map = new HashMap<>();
		map.put("hs", hs);
		map.put("keyword", keyword);
		
		System.out.println("getContent map : " + map);
		List<BoardVO> c_list = getSql().selectList("search.content", map);
		return c_list;
	}
	
}
