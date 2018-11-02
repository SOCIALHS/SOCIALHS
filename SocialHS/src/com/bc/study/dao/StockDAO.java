package com.bc.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.bc.mybatis.DBService;
import com.bc.study.vo.StockBoardVO;

public class StockDAO {
private static SqlSession ss;
	
	private synchronized static SqlSession getSql() {
		ss = DBService.getFactory().openSession(true);
		return ss;
	}
	public static java.util.List<StockBoardVO> getStockList() {
		return getSql().selectList("Stock.list");
	}
	
	
	
	
}
