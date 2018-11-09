package com.bc.messenger.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MessengerDAO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class MsnInsCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		memberVO vo = (memberVO)session.getAttribute("memberVO");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String send_id = vo.getId();
		String recv_id = request.getParameter("recv_id");
		
		System.out.println("title: "+ title);
		System.out.println("content: "+ content);
		System.out.println("send_id"+ send_id);
		System.out.println("recv_id"+ recv_id);
		
		
		
		MessengerVO msgVO = new MessengerVO();
		msgVO.setTitle(title);
		msgVO.setContent(content);
		msgVO.setSend_id(send_id);
		msgVO.setRecv_id(recv_id);
		
		MessengerDAO.insertMsg(msgVO);
		
		
		return "MessengerController?type=msnList";
	}

}
