package com.bc.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.memberDAO;
import com.bc.share.command.Command;

public class idchkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		
		memberDAO dao = new memberDAO();
		int chk = dao.idCheck(id);
		
		if (chk == 0) {
			//DB상에 아이디가 있을 때->회원가입 화면 이동
			System.out.println("사용중인 아이디입니다.");
		}
		
		return "memberController?type=join";
		
	}
	

}
