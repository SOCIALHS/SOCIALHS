package com.bc.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.member.memberDAO;
import com.bc.share.command.Command;

public class loginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String path = null;
		boolean log_check = false;
		
		HttpSession session = request.getSession();
		memberDAO dao = new memberDAO();
		int chk = dao.loginCheck(id, pw);
			
		if (chk == 0) {
			//비밀번호가 틀릴 경우->로그인 화면 이동
			System.out.println("비밀번호를 확인해주세요.");
			session.setAttribute("log_check", false);
			path = "index.jsp";
		} else if (chk == -1) {
			//아이디가 없을 경우->로그인 화면 이동
			System.out.println("존재하지 않는 아이디입니다.");
			session.setAttribute("log_check", false);
			path = "index.jsp";
		} else {
			//로그인 성공 -> 메인화면 이동
			System.out.println("로그인 성공!");
			session.setAttribute("memberid", id);
			session.setAttribute("log_check", true);
			System.out.println(log_check);
			path = "index.jsp";
		}
		
		return path;
		
	}
	
}
