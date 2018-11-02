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
	public static List<BullteinBoardVO> getBullteinList() {
		return getSql().selectList("BullteinBoard.list");
		
	}
	
}
