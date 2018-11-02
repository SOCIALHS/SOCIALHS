package com.bc.share.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class HobbyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		request.setAttribute("hs_flag", "hobby");
		return "Location.jsp";
	}

}
