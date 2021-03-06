package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.dao.MainWriteDAO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;

public class MainWriteOkCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		// TODO Auto-generated method stub
		System.out.println("-----------------------------------------");
		HttpSession session = request.getSession();
		String bbs_idx = (String)request.getParameter("bbs_idx");
		String l_idx = (String)request.getParameter("l_idx");
		String title = (String)request.getParameter("title");
		String req_member = (String)request.getParameter("req_member");
		String time = (String)request.getParameter("time");
		String place = (String)request.getParameter("place");
		String content = (String)request.getParameter("content");
		String latitude = (String)request.getParameter("latitude");
		String longitude = (String)request.getParameter("longitude");
		String id = (String)request.getParameter("id");
		String sl_idx = (String)request.getParameter("sl_idx");
		
		HobbyBoardVO vo = new HobbyBoardVO();
		System.out.println("BBS_IDX : "+bbs_idx);
		System.out.println("찍히니?!");
		System.out.println("title : "+title);
		System.out.println("sl_idx : "+sl_idx);
		vo.setBbs_idx(bbs_idx);
		vo.setL_idx(l_idx);
		vo.setTitle(title);
		vo.setReq_member(req_member);
		vo.setTime(time);
		vo.setPlace(place);
		vo.setContent(content);
		vo.setLatitude(latitude);
		vo.setLongitude(longitude);
		vo.setId(id);
		vo.setSl_idx(sl_idx);
		
		String hs = (String)session.getAttribute("hs");
		String hs_idx = "";
		System.out.println("hs : "+hs);
		if(hs.equals("hobby")) {
			hs_idx = "h";
		}else if(hs.equals("study")) {
			hs_idx = "s";
		}
		vo.seths(hs_idx);
		System.out.println("hs_idx : "+hs_idx);
		System.out.println("vo : "+vo);
		
		MainWriteDAO.insertB_Board(vo);
		System.out.println("입력 완료");
		
		System.out.println("=================글작성 10점 주는곳====================");
		MainWriteDAO.updatePoint(id);
		System.out.println("10점 줌");
		System.out.println("=================글작성 10점 주는곳====================");
		
		List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");
		System.out.println("LocationIdx : "+location.get(0).getL_Idx());
		System.out.println("location : "+location);
		return "LocationController?hs="+hs+"&location="+location.get(0).getL_Idx();
	}

}
