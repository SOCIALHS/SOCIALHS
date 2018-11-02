package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class FreeBoardCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<FreeBoardVO> list = FreeBoardDAO.getFreeList(); 
		return "minseong/freeBoard.jsp";
	}

}