package com.bc.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.member.memberVO;
import com.bc.mybatis.DBService;

public class AdminDAO {
private static SqlSession ss;
		
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	//아이디 조회
	public static AdminVO selectAid (String id) {
		return getSql().selectOne("admin.Aidchk", id);
	}
	
	//로그인 시 관리자인지 확인 
	
	//전체 게시글 수(cnt) 조회
	public int getWriteCount() {
		int totalCount = getSql().selectOne("admin.allWriteCount");
		return totalCount;
		
	}
	
	//전체 게시글 조회
	public static List<AdminVO> getAllList(Map<String, String> map) {
		return getSql().selectList("admin.allList", map);
	}
	
	//전체 회원들 수(cnt) 조회
	public int getMemberCount() {
		int membertotCnt = getSql().selectOne("admin.allMemberCount");
		return membertotCnt;
	}
	
	//전체 회원 리스트 조회
	public static List<memberVO> getAllmemberList(Map<String, String> map) {
		return getSql().selectList("admin.allmemberInfo", map);
	}
	
}
