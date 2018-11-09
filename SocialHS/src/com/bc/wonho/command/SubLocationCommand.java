package com.bc.wonho.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;
import com.bc.study.dao.AttendanceDAO;
import com.bc.study.vo.AttendanceBoardVO;

public class SubLocationCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");
		
		String hs = (String)session.getAttribute("hs");
		hs = hs.substring(0, 1);
		System.out.println("나오니 hs : " + hs);
		
		String sl_idx = request.getParameter("sl_idx");
		System.out.println("나오니 : " + sl_idx);
		
		String l_idx = location.get(0).getL_Idx();
		List<SubLocationVO> list = SubLocationDAO.getSubLocation(l_idx);
		session.setAttribute("SubLocation", list);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("hs", hs);
		map.put("sl_idx", sl_idx);
		
		System.out.println("map : " + map);
		List<BoardVO> subBoard = SubLocationDAO.getBoardAll(map);
		System.out.println("subBoard: "+ subBoard);
		session.setAttribute("subBoard", subBoard);
		
		return "wonho/sungbuk.jsp";
	}
}
