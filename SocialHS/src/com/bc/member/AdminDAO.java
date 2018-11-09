package com.bc.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;

public class AdminDAO {
private static SqlSession ss;
		
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	//전체 게시글 수(cnt) 조회
	public int getTotalCount() {
		int totalCount = getSql().selectOne("admin.allWriteCount");
		return totalCount;
		
	}
	
	//전체 게시글 조회
	private static List<AdminVO> getAllList(Map<String, String> map) {
		return getSql().selectList("admin.allList", map);
	}
	
	//전체 회원들 수(cnt) 조회
	
	//전체 회원 리스트 조회
	private static List<memberVO> getAllmemberList(Map<String, String> map) {
		return getSql().selectList("admin.allmemberInfo", map);
	}

}
