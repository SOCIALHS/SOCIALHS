package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class FreeBoardDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String path = null;
		
		FreeBoardDAO.delete(bb_idx);
		path = "FreeController?type=freeboardList";
		return path;
	}

}
