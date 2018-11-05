package com.bc.minseong.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.share.command.Command;

public class BullteinBoardWriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(">>writecommand 까지 옴");

		String chk = request.getParameter("write_chk");
		System.out.println("chk : "+ chk);
		String path = null;
		if (chk == null) {
			System.out.println("널");
			path = "minseong/bullteinBoardWrite.jsp";
			System.out.println(path);
		} else {
			System.out.println("널 아님");
			BullteinBoardVO bbvo = new BullteinBoardVO();
			bbvo.setId(request.getParameter("id"));
			bbvo.setTitle(request.getParameter("title"));
			bbvo.setContent(request.getParameter("content"));
			BullteinBoardDAO.insert(bbvo);
			
			path = "StudyController?type=bulltein";
			System.out.println(path);
		}
		return path;
	}


}
