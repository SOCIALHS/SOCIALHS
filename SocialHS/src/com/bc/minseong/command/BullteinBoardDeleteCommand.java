package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class BullteinBoardDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String path = null;
		BullteinBoardDAO.delete(bb_idx);
		path = "BullteinController?type=bullteinList";
		return path;
		
	}


}
