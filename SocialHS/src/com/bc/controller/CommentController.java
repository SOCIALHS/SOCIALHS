package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.comment.command.CommentDeleteOkCommand;
import com.bc.comment.command.CommentWriteOkCommand;
import com.bc.main.command.HobbyMainCommand;
import com.bc.main.command.StudyMainCommand;
import com.bc.main.dao.LocationDAO;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;
import com.bc.study.command.CategoryCommand;

@WebServlet("/Comment")
public class CommentController extends HttpServlet {
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
		
		System.out.println("Comment까지왔음");
		request.setCharacterEncoding("UTF-8");
		
		String type = request.getParameter("type");
		Command comm = null;
		String path = "";
		System.out.println("type : "+type);
		if(type.equals("writeOk")) {
			comm = new CommentWriteOkCommand();
		}else if(type.equals("deleteOk")) {
			comm = new CommentDeleteOkCommand();
		}
	
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
