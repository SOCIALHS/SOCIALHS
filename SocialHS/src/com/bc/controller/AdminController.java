package com.bc.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.admin.command.allListCommand;
import com.bc.admin.command.allmemberInfoCommand;
import com.bc.admin.command.hobbylistCommand;
import com.bc.admin.command.infoCommand;
import com.bc.admin.command.searchCommand;
import com.bc.admin.command.studylistCommand;
import com.bc.share.command.Command;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String path = null;
		System.out.println("type : "+type);
		Command comm = null;
		
		if (type.equals("allList")) {
			comm = new allListCommand();
		} else if (type.equals("hobbylist")) {
			comm = new hobbylistCommand();
		} else if (type.equals("studylist")) {
			comm = new studylistCommand();
		} else if (type.equals("allmemberInfo")) {
			comm = new allmemberInfoCommand();
		} 
		else if (type.equals("search")) {
			comm = new searchCommand();
		} else if (type.equals("info")) {
			comm = new infoCommand();
		} 
		
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
