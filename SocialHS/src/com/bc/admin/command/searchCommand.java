package com.bc.admin.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.admin.A_AllBoardVO;
import com.bc.admin.AdminDAO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class searchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String search = request.getParameter("search");
		System.out.println("검색 내용 : " + search);
		
		int num = Integer.parseInt(request.getParameter("select"));
		System.out.println("select : " + num);
		String path = "";
		
		if (search == null || search.equals("")) {
			path = "AdminController?type=allList";
		} else {
			switch (num) {
			case 1: //제목/내용
				List<A_AllBoardVO> searchlist = AdminDAO.searchlist(search);
				System.out.println("검색 제목/내용 searchlist : " + searchlist);
				System.out.println("!!! 확인 : " + searchlist.size());
				session.setAttribute("searchlist", searchlist);
				
				path = "Admin/searchWrite.jsp";
				break;
				
			case 2: //아이디
				List<memberVO> searchId = AdminDAO.searchId(search);
				System.out.println("검색 아이디 search : " + searchId);
				session.setAttribute("searchlist", searchId);
				path="Admin/searchMember.jsp";
				break;
			}
			
		}
		
		return path;
		
	}
	

}
