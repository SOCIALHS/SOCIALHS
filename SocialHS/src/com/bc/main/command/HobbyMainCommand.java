package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;

public class HobbyMainCommand implements Command {

	
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");
		
		System.out.println("location : "+location);
		String hs = (String)session.getAttribute("hs");
		
		System.out.println("check!! HS2 : "+hs);
		String l_idx = location.get(0).getL_Idx();
		List<SubLocationVO> list = SubLocationDAO.getSubLocation(l_idx);
		
		System.out.println("list : "+ list);
		session.setAttribute("SubLocation", list);
		return "HobbyMain.jsp";
	}

}
