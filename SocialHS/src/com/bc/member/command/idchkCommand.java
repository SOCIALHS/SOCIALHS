package com.bc.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.bc.member.memberDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class idchkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String path = null;
		
		memberDAO dao = new memberDAO();
		memberVO usingid = dao.selectId(id);
		
		if (usingid.equals(id)) {
			System.out.println("id: " + id);
			System.out.println("사용중인 아이디입니다.");
			JOptionPane.showMessageDialog(null, id + "는 사용중인 아이디입니다.");
					
		} else {
			System.out.println("id: " + id);
			System.out.println("사용가능한 아이디입니다.");
			JOptionPane.showMessageDialog(null, id + "는 사용가능한 아이디입니다.");
			
		}
		
		return "mingyeong/join.jsp";
		
	}
	

}
