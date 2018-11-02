package com.bc.share.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("hs_flag", "study");
		return "Location.jsp";
	}

}
