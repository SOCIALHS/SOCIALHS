package com.bc.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.dongwu.command.JapaneseCommand;
import com.bc.jieun.command.EnglishBoardCommand;
import com.bc.main.command.StudyMainCommand;
import com.bc.minseong.command.StockBoardCommand;
import com.bc.share.command.Command;




@WebServlet("/StudyController")
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
			//�썝�븯�뒗 �쐞移섎줈 �꽆湲� command �깮�꽦
		}else if(type.equals("jap")) {
			comm = new JapaneseCommand();

		}else if(type.equals("eng")) {
			System.out.println(">> eng 체크");
			comm = new EnglishBoardCommand();

		}else if(type.equals("stoc")) {
			comm = new StockBoardCommand();

		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
