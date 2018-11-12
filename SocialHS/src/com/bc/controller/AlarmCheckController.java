package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.dao.MainDAO;
import com.bc.share.command.Command;

/**
 * Servlet implementation class AlarmCheckController
 */
@WebServlet("/AlarmCheck")
public class AlarmCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String type = request.getParameter("type");
		String bb_idx = request.getParameter("bb_idx");
		String path = null;
		
		if (type.equals("com")) {
			/*AlarmCheck?type=com&bbc_idx=${bbc_idx}&bb_idx=${bb_idx}*/
			String bbc_idx = request.getParameter("bbc_idx");
			MainDAO.checkCom(bbc_idx);
		} else if (type.equals("mem")) {
			/*AlarmCheck?type=mem&bb_idx=${bb_idx}*/
			MainDAO.checkMem(bb_idx);
		}
		
		path = "HobbyController?type=view&bb_idx="+bb_idx;
		request.getRequestDispatcher(path).forward(request, response);
		
	}
}
