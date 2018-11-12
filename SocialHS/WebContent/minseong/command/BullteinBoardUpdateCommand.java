package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.hobby.dao.BasketballDAO;
import com.bc.hobby.vo.BasketballBoardVO;
import com.bc.main.vo.BoardVO;
import com.bc.share.command.Command;

public class BullteinBoardUpdateCommand implements Command {


	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String bb_idx = request.getParameter("bb_idx");
		String chk = request.getParameter("chk");
		String path = null;

		if (chk == null) {
			path = "minseong/bullteinBoardUpdate.jsp";
			System.out.println("업데이트 널");
		} else {
			BoardVO bbvo = new BoardVO();
			System.out.println("업데이트 널 아님");
			bbvo.setTitle(request.getParameter("title"));
			bbvo.setContent(request.getParameter("content"));
			bbvo.setBb_idx(Integer.parseInt(bb_idx));
			BullteinBoardDAO.update(bbvo);
			System.out.println("title 값도 넘어오나 ? : " + request.getParameter("title"));
			System.out.println("content 값도 넘어오나 ? : " + request.getParameter("content"));

			path = "/minseong/bullteinBoardOne.jsp";
		}

		return path;

	}
}
