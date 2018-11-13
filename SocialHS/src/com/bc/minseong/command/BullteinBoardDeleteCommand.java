package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.comment.dao.CommentDAO;
import com.bc.share.command.Command;

public class BullteinBoardDeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		
		CommentDAO.b_deleteComment(bb_idx);
		BullteinBoardDAO.delete(bb_idx);
		
		System.out.println("bb_idx :" + bb_idx);
		return "BullteinController?type=bullteinList";
		
	}

}
