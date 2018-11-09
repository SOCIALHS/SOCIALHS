package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.command.HobbyMainCommand;
import com.bc.main.command.MainViewCommand;
import com.bc.main.command.MainWriteCommand;
import com.bc.main.command.MainWriteOkCommand;
import com.bc.mingyeong.command.PhotoBoardCommand;
import com.bc.share.command.Command;
import com.bc.swan.command.BaseballBoardCommand;


@WebServlet("/Search")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		String path = null;
		Command comm;
		System.out.println("type : " + type);
		comm = null;
		
		if(type.equals("main")) {
			comm = new HobbyMainCommand();
		}else if(type.equals("write")) {
			comm = new MainWriteCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		

	}

}
