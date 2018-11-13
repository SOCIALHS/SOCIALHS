package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAwriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		
		BoardVO bbvo = new BoardVO();
		bbvo.setTime(request.getParameter("title"));
		bbvo.setContent(request.getParameter("content"));
		QNA_DAO.insert(bbvo);
		
		return "QNA?type=QNAlist";
		
	}

}
