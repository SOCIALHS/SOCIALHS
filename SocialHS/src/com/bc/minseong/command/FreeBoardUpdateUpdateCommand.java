package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class FreeBoardUpdateUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int bb_idx = Integer.parseInt(request.getParameter("bb_idx"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println("bb_idx:" + bb_idx);
		
		BoardVO bvo = new BoardVO();
		bvo.setBb_idx(bb_idx);
		bvo.setTitle(title);
		bvo.setContent(content);
		System.out.println("bvo: " + bvo);
		
		int result = FreeBoardDAO.update(bvo);
		System.out.println("처리건수: " + result);
		
		String path = "FreeController?type=freeOne&bb_idx="+ bb_idx;
		
		return path;
	}

}
