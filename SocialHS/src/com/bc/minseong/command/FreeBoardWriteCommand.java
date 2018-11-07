package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class FreeBoardWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String chk = request.getParameter("chk");
		
		BoardVO fvo = new BoardVO();
		fvo.setTitle(request.getParameter("title"));
		fvo.setContent(request.getParameter("content"));
		String path = null;
		if (chk == null) {
			path = "minseong/freeBoardWrite.jsp";
		} else {
			FreeBoardDAO.insert(fvo);
			path = "FreeController?type=freeList";
		}
		
		return path;
	}

}
