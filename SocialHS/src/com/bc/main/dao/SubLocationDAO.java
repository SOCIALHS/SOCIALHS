package com.bc.main.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.mybatis.*;

public class SubLocationDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		
		return ss;
	}
	
	
	public static List<SubLocationVO> getSubLocation(String location) {
		return getSql().selectList("SubLocation.list",location);
	}
	
	public static List<SubLocationVO> getSubAll(){
		return getSql().selectList("SubLocation.all");
	}
	
	
	public static List<BoardVO> getBoardAll(Map<String, String> map) {
		System.out.println("checkBoard");
		return getSql().selectList("SubLocation.listBoard", map);
	}
	
	public int getTotCommentCnt(Map<String, String> map) {
		int totCommCnt = getSql().selectOne("SubLocation.listBoardCommentCnt", map);
		return totCommCnt;
	}
	
	public static List<BoardVO> getBoardCommList(Map<String,String> map) {
		return getSql().selectList("SubLocation.BoardCommList", map);
	}
	
}
