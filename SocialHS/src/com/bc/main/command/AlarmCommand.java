package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MainDAO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
import com.bc.share.command.Command;

public class AlarmCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<MessengerVO> msnAlm;
		List<BoardVO> memAlm;
		List<CommentVO> comAlm;
		msnAlm = MainDAO.getMsnAlm("test");
		System.out.println("msnAlm: "+ msnAlm);
		memAlm = MainDAO.getMemAlm("test");
		System.out.println("memAlm: "+ memAlm);
		comAlm = MainDAO.getComAlm("test");
		System.out.println("comAlm: "+ comAlm);
		
		
		int sumMsn = 0;
		int sumMem = 0;
		int sumCom = 0;
		int sum = 0;
		for (MessengerVO msn : msnAlm) {
			sumMsn += msn.getChk();
		}
		for (BoardVO board : memAlm) {
			sumMem += board.getChk();
		}
		for (CommentVO com : comAlm) {
			sumCom += com.getChk();
		}
		
		
		HttpSession session = request.getSession();
		session.setAttribute("msnAlm", msnAlm);
		session.setAttribute("memAlm", memAlm);
		session.setAttribute("comAlm", comAlm);
		
		sum = sumMsn + sumMem + sumCom;
		
		return sum+"";
	}

}
