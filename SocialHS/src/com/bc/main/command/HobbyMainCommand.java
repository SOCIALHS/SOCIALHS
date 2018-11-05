package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.SubLocationDAO;
import com.bc.hobby.vo.SubLocationVO;
import com.bc.share.command.Command;

public class HobbyMainCommand implements Command {

	
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String location = (String)session.getAttribute("location");
		String hs = (String)session.getAttribute("hs");
		System.out.println("check!! Location2 : "+location);
		System.out.println("check!! HS2 : "+hs);
		
		List<SubLocationVO> list = SubLocationDAO.getSubLocation(location);
		
		System.out.println("list : "+ list);
		session.setAttribute("SubLocation", list);
		return "HobbyMain.jsp";
	}

}
