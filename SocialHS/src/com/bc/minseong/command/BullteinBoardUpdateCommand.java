package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class BullteinBoardUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String path = null;
		System.out.println("ok");
		BoardVO bbvo = new BoardVO();
		bbvo.setTitle(request.getParameter("title"));
		bbvo.setContent(request.getParameter("content"));
		bbvo.setBb_idx(Integer.parseInt(bb_idx));
		BullteinBoardDAO.update(bbvo);

		path = "minseong/bullteinBoardOne.jsp";

		return path;

	}
}
