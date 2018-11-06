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
	
	public static FreeBoardVO selectOne(String bb_idx) {
		FreeBoardVO fvo = getSql().selectOne("one", bb_idx);
		return fvo;
	}
	
	public static int insert(FreeBoardVO fvo) {
		int result = getSql().insert("insert", fvo);
		getSql().commit();
		return result;
	}
	
	
	public static int delete(String bb_idx) {
		int result = getSql().delete("delete", bb_idx);
		getSql().commit();
		return result;
	}
}
