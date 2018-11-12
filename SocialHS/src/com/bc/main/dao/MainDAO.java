package com.bc.main.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
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
	
	public static List<MessengerVO> getMsnAlm(String id) {
		return getSql().selectList("socialhs.msnAlm", id);
	}
	
	public static List<BoardVO> getMemAlm(String id) {
		return getSql().selectList("socialhs.memAlm", id);
	}
	
	public static List<CommentVO> getComAlm(String id) {
		return getSql().selectList("socialhs.comAlm", id);
	}
	
	
	// 알람 체크 DAO
	public static int checkCom(String bbc_idx) {
		return getSql().update("socialhs.checkCom", bbc_idx);
	}
	public static int checkMem(String bb_idx) {
		return getSql().update("socialhs.checkMem", bb_idx);
	}
	
	
	
}
