package com.bc.hobby.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.BasketballDAO;
import com.bc.hobby.dao.HobbyBoardDAO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.share.command.Command;


public class HobbyWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("check write");
		String bb_idx = request.getParameter("bb_idx");
		
		System.out.println("bb_idx : "+bb_idx);
		HobbyBoardVO hbvo = HobbyBoardDAO.getOne(bb_idx);
		session.setAttribute("hbvo", hbvo);
		return "view.jsp";
	}

}
