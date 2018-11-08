package com.bc.minseong.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;



@WebServlet("/FreeController")

public class FreeBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	
	private void process (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String bb_idx = request.getParameter("bb_idx");
		String path = null;
		Command comm = null;
		
		if(type.equals("freeList")) {
			comm = new BullteinBoardListCommand();
		}else if(type.equals("freeOne")) {
			comm = new BullteinBoardOneCommand();
		}else if(type.equals("freeWrite")) {
			comm = new BullteinBoardWriteCommand();
		}else if(type.equals("freeUpdate")) {
			comm = new BullteinBoardUpdateCommand();
		}else if(type.equals("freeDelete")) {
			comm = new BullteinBoardDeleteCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
