package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class QNAwriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		System.out.println("QNAwrite 커멘드까지 오자너?");
		
		BoardVO qvo = new BoardVO();
		String id = request.getParameter("id");
		if (id == "") { qvo.setId("ANONYMOUS"); } 
		else { qvo.setId(id); }
		
		qvo.setTitle(request.getParameter("title"));
		qvo.setContent(request.getParameter("content"));
		
		QNA_DAO.insert(qvo);
		
		return "QNA?type=QNAlist";
		
	}

}
