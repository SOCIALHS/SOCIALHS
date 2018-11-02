package com.bc.hobby.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.HobbyVO;
import com.bc.mybatis.DBService;

public class HobbyDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	
	public static List<HobbyVO> getHobbyList() {
		return getSql().selectList("socialhs.hobbyList");
	}
	
	
}
