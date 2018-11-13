package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAupdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String chk = request.getParameter("chk");
		String path = null;
		
		if (chk == null) {
			path = "minseong/QNAupdate.jsp";
		} else {
			BoardVO bbvo = new BoardVO();
			bbvo.setTime(request.getParameter("title"));
			bbvo.setContent(request.getParameter("content"));
			bbvo.setBb_idx(Integer.parseInt(bb_idx));
			path = "/minseong/QNAone.jsp";
		}
		return path;
	}

}
