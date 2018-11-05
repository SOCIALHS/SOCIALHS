package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class BullteinBoardWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String chk = request.getParameter("write_chk");
		String path = null;
		if (chk == null) {
			path = "../minseong/bullteinBoardWrite.jsp";
		} else {
			BullteinBoardVO bbvo = new BullteinBoardVO();
			bbvo.setId(request.getParameter("id"));
			bbvo.setTitle(request.getParameter("title"));
			bbvo.setContent(request.getParameter("content"));
			BullteinBoardDAO.insert(bbvo);
			
			path = "StudyController?type=bulltein";
		}
		return path;
	}


}
