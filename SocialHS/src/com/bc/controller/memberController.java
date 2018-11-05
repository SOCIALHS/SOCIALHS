package com.bc.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.member.command.deleteCommand;
import com.bc.member.command.idchkCommand;
import com.bc.member.command.joinCommand;
import com.bc.member.command.joinOkCommand;
import com.bc.member.command.loginCommand;
import com.bc.member.command.logoutCommand;
import com.bc.member.command.myPageCommand;
import com.bc.member.command.updateCommand;
import com.bc.member.command.updateMyinfoCommand;
import com.bc.share.command.Command;

@WebServlet("/memberController")
public class memberController extends HttpServlet {
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
		
		if (type.equals("login")) {
			comm = new loginCommand();
		} else if (type.equals("logout")) {
			comm = new logoutCommand();
		}
		else if (type.equals("join")) {
			comm = new joinCommand();
		} else if (type.equals("joinOk")) {
			comm = new joinOkCommand();
		}
		
		else if (type.equals("idchk")) {
			comm = new idchkCommand();
		}
		
		//===================================
		else if (type.equals("myPage")) {
			comm = new myPageCommand();
		}
		
		
		else if (type.equals("update")) {
			comm = new updateCommand();
		} else if (type.equals("updateOk")) {
			comm = new updateMyinfoCommand();
		}
		else if (type.equals("delete")) {
			comm = new deleteCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}

}
