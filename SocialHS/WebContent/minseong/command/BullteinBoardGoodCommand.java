package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class BullteinBoardGoodCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		BoardVO bbvo = new BoardVO();
		String bb_idx = request.getParameter("bb_idx");
		
		int good = bbvo.getGood();
		bbvo.setGood(good);
		BullteinBoardDAO.updateGood(bb_idx);

		return "minseong/bullteinBoardOne.jsp";
	}

}
