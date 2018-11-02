package com.bc.study.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.command.HobbyMainCommand;
import com.bc.main.command.StudyMainCommand;
import com.bc.share.command.Command;
import com.bc.share.command.HobbyCommand;
import com.bc.share.command.StudyCommand;
import com.bc.swan.command.BaseballBoardCommand;




@WebServlet("/StudyMainController")
public class StudyMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String path = null;
		System.out.println("type : "+type);
		Command comm = null;
		
		if(type.equals("main")) {
			comm = new StudyMainCommand();
		}else if(type.equals("board")) {
			//원하는 위치로 넘길 command 생성
		}else if(type.equals("jap")) {
			comm = new JapaneseCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
