package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class BullteinBoardOneCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<BullteinBoardVO> list = BullteinBoardDAO.getList();
		request.setAttribute("list", list);
		return "minseong/bullteinBoardOne.jsp";
	}


}
