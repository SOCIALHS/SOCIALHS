package com.bc.main.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.BoardVO;
import com.bc.mybatis.DBService;

public class MainDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	
	public static List<BbsCodeVO> getHobbyList() {
		return getSql().selectList("socialhs.hobbyList");
	}
	
	public static List<BbsCodeVO> getStudyList() {
		return getSql().selectList("socialhs.studyList");
	}
	
	public static int getMsnAlm(String id) {
		String result = getSql().selectOne("socialhs.MSNChk", id);
		if (result == null) {
			result = "0";
		}
		return Integer.parseInt(result);
	}
	
	public static int getMemAlm(String id) {
		String result = getSql().selectOne("socialhs.MEMChk", id);
		if (result == null) {
			result = "0";
		}
		return Integer.parseInt(result);
	}
	
}
