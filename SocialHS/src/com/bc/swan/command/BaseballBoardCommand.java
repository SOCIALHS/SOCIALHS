package com.bc.swan.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.hobby.dao.BaseballDAO;
import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.share.command.Command;

public class BaseballBoardCommand implements Command {

	
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<BaseballBoardVO> list = BaseballDAO.getBaseList();
		request.setAttribute("list", list);
		
		
		return "swan/baseballBoard.jsp";
	}

}
