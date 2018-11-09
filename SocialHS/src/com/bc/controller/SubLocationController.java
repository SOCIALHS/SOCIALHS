package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.command.HobbyMainCommand;
import com.bc.main.command.StudyMainCommand;
import com.bc.main.dao.LocationDAO;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;
import com.bc.study.command.CategoryCommand;
import com.bc.wonho.command.SubLocationCommand;
import com.bc.wonho.command.SubLocationMoreCommand;





@WebServlet("/SubLocationController")
public class SubLocationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(request, response);
	}
	
	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		String sl_idx = request.getParameter("sl_idx");
		String type = request.getParameter("type");
		System.out.println("sl_idx : "+ sl_idx);
		
		String path = null;
		Command comm = null;
		
		if(type.equals("sub")) {
			comm = new SubLocationCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
