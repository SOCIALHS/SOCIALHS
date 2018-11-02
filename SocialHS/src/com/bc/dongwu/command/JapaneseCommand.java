package com.bc.dongwu.command;

import com.bc.hobby.dao.BaseballDAO;
import com.bc.hobby.vo.BaseballBoardVO;
import com.bc.share.command.Command;
import com.bc.study.dao.JapaneseDAO;

public class JapaneseCommand implements Command {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<BaseballBoardVO> list = JapaneseDAO.getJapList();
		request.setAttribute("list", list);
		
		return "dongwu/japaneseBoard.jsp";
	}
}
