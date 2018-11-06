package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class MessengerCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		memberVO vo = (memberVO)session.getAttribute("memberVO");
		String id = vo.getId();
		
		List<MessengerVO> list = MessengerDAO.getList(id);
		request.setAttribute("msnList", list);
		
		
		
		
		
		return "swan/messenger.jsp";
	}

}
