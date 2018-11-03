package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.dao.MainDAO;
import com.bc.main.vo.BbsCodeVO;
import com.bc.share.command.Command;

public class ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		String type = request.getParameter("type");
		
		List<BbsCodeVO> list = null; 
		
		if (type.equals("hobby")) {
			list = MainDAO.getHobbyList();
		} else if (type.equals("study")) {
			list = MainDAO.getStudyList();
		}
		String result = "{\"list\":[";
		for (BbsCodeVO vo : list) {
			result += "{";
			result += "\"h_idx\" : \""+vo.getBbs_idx()+"\",";
			result += "\"h_name\" : \""+vo.getBbs_name()+"\"";
			result += "},";
		}
		result = result.substring(0, result.length() - 1);
		result += "]}";
		
		return result;
	}

}
