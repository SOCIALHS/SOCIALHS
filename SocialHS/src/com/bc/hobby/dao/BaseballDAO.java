package com.bc.hobby.dao;


import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;

public class BaseballDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession();
		
		return ss;
	}
	
}
