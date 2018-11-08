package com.bc.minseong.command;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BoardVO;
import com.bc.mybatis.DBService;

public class FreeBoardDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	//공지 게시판 리스트
	public static List<BoardVO> getList() {
		List<BoardVO> list = getSql().selectList("free.FreeList");
		return list;
		
	}

	//게시글 상세페이지
	public static BoardVO selectOne(String bb_idx) {
		BoardVO bbvo = getSql().selectOne("free.FreeOne", bb_idx);
		return bbvo;
	}
	
	
	//게시글 작성
	public static int insert(BoardVO fvo) {
		int result = getSql().insert("free.FreeWrite", fvo);
		return result;
	}
	
	
	//게시글 수정
	public static int update(BoardVO fvo) {
		int result = getSql().update("free.FreeUpdate", fvo);
		return result;
	}
	
	//게시글 삭제
	public static int delete(String bb_idx) {
		int result = getSql().delete("free.FreeDelete", bb_idx);
		return result;
	}

	
	
	
	
	
//	public static int getTotalCount() {
//		int totalCount = getSql().selectOne("totalCount");
//		return totalCount;
//	}
	
	
}
