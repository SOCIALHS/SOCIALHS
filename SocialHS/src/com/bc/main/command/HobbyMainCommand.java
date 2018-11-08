package com.bc.main.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.hobby.dao.HobbyBoardDAO;
import com.bc.hobby.vo.HobbyBoardVO;
import com.bc.main.dao.SubLocationDAO;
import com.bc.main.vo.LocationVO;
import com.bc.main.vo.SubLocationVO;
import com.bc.share.command.Command;

public class HobbyMainCommand implements Command {

	
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");	
		String hs = (String)session.getAttribute("hs");
		String l_idx = location.get(0).getL_Idx();
		List<SubLocationVO> list = SubLocationDAO.getSubLocation(l_idx);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("l_idx", l_idx);
		map.put("hs","h"); 
		
		
		List<HobbyBoardVO> HobbyList = HobbyBoardDAO.getMainCategoryList(map);
		System.out.println("HobbyList: "+HobbyList);
		request.setAttribute("MainList", HobbyList); //HobbyList는 HobbyMain에쓸 리스트를 저장한 객체 
		//MainList는 공용으로 사용하는 것이고 Main에서 사용할 객체들의 집합을 의미
		
		System.out.println("list : "+ list);
		session.setAttribute("SubLocation", list);
		return "HobbyMain.jsp";
	}

}
