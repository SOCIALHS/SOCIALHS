package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.dao.CommentDAO;
import com.bc.main.vo.CommentVO;
import com.bc.share.command.Command;

public class CommentWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bbc_idx = request.getParameter("bbc_idx");
		String bb_idx = request.getParameter("bb_idx");
		String cPage = request.getParameter("cPage");
		//String chk = request.getParameter("chk");
		System.out.println("댓글 입력 처리1");
		
		CommentVO cvo = new CommentVO();
		cvo.setId(request.getParameter("id"));
		cvo.setPw(request.getParameter("pw"));
		cvo.setContent(request.getParameter("content"));
		System.out.println("cvo :" + cvo);
		CommentDAO.insertComment(cvo);
		System.out.println("댓글 입력 처리2");
		return "minseong/bullteinBoardOne.jsp";
		

	}

}
