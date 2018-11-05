package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class BullteinBoardOneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		BullteinBoardVO bbvo = BullteinBoardDAO.selectOne(bb_idx);
		request.getSession().setAttribute("BullteinBoardVO", bbvo);
		return "BullteinWrite.jsp";
		
	}


}
