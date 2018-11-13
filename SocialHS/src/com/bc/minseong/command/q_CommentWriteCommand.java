package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.comment.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class q_CommentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		if(id =="") {
			id = "ANONYMOUS";
		}
		
		String bb_idx = request.getParameter("bb_idx");
		String cPage = request.getParameter("cPage");
		
		CommentVO cvo = new CommentVO();
		cvo.setId(id);
		cvo.setBb_idx(bb_idx);
		cvo.setContent(request.getParameter("content"));
		CommentDAO.insertComment(cvo);
		
		return "QNA?type=QNAone&bb_idx"+bb_idx;
	}

}
