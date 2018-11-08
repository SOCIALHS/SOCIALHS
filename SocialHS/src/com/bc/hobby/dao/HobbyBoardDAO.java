package com.bc.hobby.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.mybatis.*;


public class HobbyBoardDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	public static List<HobbyBoardVO> getHobbyMainList(Map<String, String> map){
		System.out.println("check2");
		return getSql().selectList("hobbyboard.list", map);
		
	}
	
	public static List<HobbyBoardVO> getMainCategoryList(Map<String, String> map){
		System.out.println("check3");
		return getSql().selectList("hobbyboard.list_category", map);
	}
	
	public static HobbyBoardVO getOne(String bb_idx) {
		System.out.println("check45");
		return getSql().selectOne("hobbyboard.one", bb_idx);
	}
	
	public static HobbyBoardVO getViewVo(String bb_idx) {
		System.out.println("checkGetViewVO");
		return getSql().selectOne("hobbyboard.get_ViewVO", bb_idx);
	}
	
	
	
	
	
	
	
}
