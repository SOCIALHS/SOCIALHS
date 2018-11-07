package com.bc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.command.MessengerCommand;
import com.bc.main.command.MsnDetailCommand;
import com.bc.share.command.Command;

/**
 * Servlet implementation class MessengerController
 */
@WebServlet("/MessengerController")
public class MessengerController extends HttpServlet {
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
		System.out.println("type: "+ type);
		
		Command comm = null;
		String path = "";
		if (type.equals("msnList")) {
			comm = new MessengerCommand();
		} else if (type.equals("oneList")) {
			comm = new MsnDetailCommand();
		}

		
		path = comm.exec(request, response);
		
		request.getRequestDispatcher(path).forward(request, response);
	}

}
