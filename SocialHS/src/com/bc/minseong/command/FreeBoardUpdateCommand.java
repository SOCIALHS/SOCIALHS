package com.bc.minseong.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class FreeBoardUpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		FreeBoardVO fvo = new FreeBoardVO();
		fvo.setTitle(request.getParameter("title"));
		fvo.setContent(request.getParameter("content"));
		FreeBoardDAO.insert(fvo);
		return null;
	}

}
