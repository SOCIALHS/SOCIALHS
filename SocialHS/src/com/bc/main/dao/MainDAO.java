package com.bc.main.dao;



import java.util.List;
import java.util.Map;

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
	
	//(mypage)전체 게시글 수 조회 (B_Board)
	public int getTotalCount() {
		int totalCount = getSql().selectOne("socialhs.mypagetotalCnt");
		return totalCount;
	}
	
	//(mypage)내가 쓴 전체 게시글 조회 
	public static List<BoardVO> getMypageList(Map<String, Integer> map) {
		return getSql().selectList("socialhs.mylist", map);
	}
	
	//(mypage))내가 쓴 글 상세보기 
	public static BoardVO selectOne(String id) {
		return getSql().selectOne("socialhs.myWrite", id);
	}
	
	
	
}
