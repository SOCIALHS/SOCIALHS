package com.bc.jieun.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.BoardSearchDAO;
import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class SearchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String hs = (String)session.getAttribute("hs");
		System.out.println("hs : " + hs);
		
		int v = Integer.parseInt(request.getParameter("select"));
		System.out.println("v : " + v);

		String keyword = request.getParameter("keyword");
		System.out.println("keyword : " + keyword);

		String path = "";
		
		if(keyword == null || keyword.equals("")) {
			path = "MainController?type=" + hs;
		}else {
			
			switch(v) {
			case 0 : //제목 title
				List<BoardVO> t_list = BoardSearchDAO.getTitle(hs, keyword);
				session.setAttribute("s_list", t_list);
				System.out.println(">>리스트 받아옴");
				List<BoardVO> s_list = (List<BoardVO>) session.getAttribute("s_list");
				System.out.println(s_list);
				break;
			case 1 : //작성자 id
				List<BoardVO> i_list = BoardSearchDAO.getId(hs, keyword);
				session.setAttribute("s_list", i_list);
				break;
			case 2 : //내용 content
				List<BoardVO> c_list = BoardSearchDAO.getContent(hs, keyword);
				session.setAttribute("s_list", c_list);
				break;
			}
			
			path = "jieun/search.jsp";
		}
		
		return path;
		
	}

}
