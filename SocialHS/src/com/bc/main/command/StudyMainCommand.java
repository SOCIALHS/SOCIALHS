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

public class StudyMainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		List<LocationVO> location = (List<LocationVO>)session.getAttribute("location");
		String hs = (String)session.getAttribute("hs");
		String l_idx = location.get(0).getL_Idx();
		List<SubLocationVO> list = SubLocationDAO.getSubLocation(l_idx);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("l_idx", l_idx);
		map.put("hs","s"); 
		
		System.out.println("check!! HS2 : "+hs);
		List<HobbyBoardVO> StudyList = HobbyBoardDAO.getMainCategoryList(map); //HobbyBoardVO 와 HobbyBoardDAO는 그냥 mainBoardVO로 쓰겠습니다.
		request.setAttribute("MainList", StudyList); //main에 쓸 list 저장 제일 중요!!
		//여기서 제대로 출력됨!! HobbyBoardVO를 MainBoardVO로 사용!!!
		System.out.println("StudyList : "+StudyList); 
		System.out.println("list : "+ list);
		session.setAttribute("SubLocation", list);
		return "StudyMain.jsp";
	}


}
