package com.bc.comment.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;


import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.mybatis.*;

public class CommentDAO {
	
	private static SqlSession ss;
	
	// 싱글턴 패턴: 하나의 객체만을 만들어 사용
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	
	
	public static int insertComment(CommentVO vo) {
		return getSql().insert("comment.insertComment",vo);	
	}
	
	public static int deleteComment(String bbc_idx) {
		return getSql().delete("comment.deleteComment",bbc_idx);	
	}
	
	
	
	
	
	
}