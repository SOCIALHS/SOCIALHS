package com.bc.hobby.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.hobby.command.BasketballBoardCommand;
import com.bc.main.command.HobbyMainCommand;
import com.bc.mingyeong.command.PhotoBoardCommand;
import com.bc.minseong.command.BullteinBoardListCommand;
import com.bc.minseong.command.FreeBoardCommand;
import com.bc.share.command.Command;
import com.bc.share.command.HobbyCommand;
import com.bc.share.command.StudyCommand;
import com.bc.swan.command.BaseballBoardCommand;




@WebServlet("/HobbyController")
public class HobbyMainController extends HttpServlet {
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
			comm = new HobbyMainCommand();
		}else if(type.equals("board")) {
			//�썝�븯�뒗 �쐞移섎줈 �꽆湲� command �깮�꽦
		}else if(type.equals("base")) {
			comm = new BaseballBoardCommand();
		}else if(type.equals("photo")) {
			comm = new PhotoBoardCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
