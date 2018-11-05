package com.bc.minseong.command;
import java.util.List;


import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.bc.study.vo.StockBoardVO;

public class BullteinBoardDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	//공지 게시판 리스트
	public static List<BullteinBoardVO> getList() {
		return getSql().selectList("BullteinBoard.list");
		
	}

	//게시글 상세페이지
	public static BullteinBoardVO selectOne(String bb_idx) {
		BullteinBoardVO bbvo = getSql().selectOne("one", bb_idx);
		return bbvo;
	}
	
	
	//게시글 작성
	public static int insert(BullteinBoardVO bbvo) {
		int result = getSql().insert("bulltein.BullteinWrite", bbvo);
		getSql().commit();
		return result;
	}
	
	
	//게시글 수정
	public static int update(BullteinBoardVO bbvo) {
		int result = getSql().update("update", bbvo);
		getSql().commit();
		return result;
	}
	
	//게시글 삭제
	public static int delete(String bb_idx) {
		int result = getSql().delete("delete", bb_idx);
		getSql().commit();
		return result;
	}
	
	public static int getTotalCount() {
		int totalCount = getSql().selectOne("totalCount");
		return totalCount;
	}
	
	
}
