package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class FreeBoardUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String chk = request.getParameter("chk");
		String path = null;
		
		if (chk == null) {
			path = "minseong/freeBoardUpdate.jsp";
		} else {
			BoardVO fvo = new BoardVO();
			fvo.setTitle(request.getParameter("title"));
			fvo.setContent(request.getParameter("content"));
			fvo.setBb_idx(Integer.parseInt(bb_idx));
			FreeBoardDAO.update(fvo);
			
			path = "/minseong/freeBoardOne.jsp";
		}
		
		return path;
		
	}

}
