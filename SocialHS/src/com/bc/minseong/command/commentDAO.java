package com.bc.minseong.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.main.vo.BoardVO;
import com.bc.mybatis.DBService;

public class commentDAO {
	private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		if (ss == null) {
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	
	public static List<BoardVO> getCommentList(String bbc_idx) {
		return getSql().selectList("cList", bbc_idx);
	}
	
	public static int insertComment(BoardVO cvo) {
		return getSql().insert("cinsert", cvo);
	}
	
	public static int deleteComment(String bbc_idx) {
		return getSql().delete("cdelete", bbc_idx);
	}
	
	
	
	
}
