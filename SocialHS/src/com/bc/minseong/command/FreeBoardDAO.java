package com.bc.minseong.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;

public class FreeBoardDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	public static List<FreeBoardVO> getFreeList() {
		return getSql().selectList("Free.list");
	}
}
