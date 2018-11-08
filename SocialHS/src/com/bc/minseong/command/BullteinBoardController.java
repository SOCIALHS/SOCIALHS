package com.bc.minseong.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;



@WebServlet("/BullteinController")

public class BullteinBoardController extends HttpServlet {
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
		
		if(type.equals("bullteinList")) {
			comm = new BullteinBoardListCommand();
		}else if(type.equals("bullteinOne")) {
			comm = new BullteinBoardOneCommand();
		}else if(type.equals("bullteinWrite")) {
			comm = new BullteinBoardWriteCommand();
		}else if(type.equals("bullteinUpdate")) {
			comm = new BullteinBoardUpdateCommand();
			System.out.println("업데이트 컨트롤러까진 오네?");
		}else if(type.equals("bullteinDelete")) {
			comm = new BullteinBoardDeleteCommand();
		}
		
		path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
		
	}

}
