package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.hobby.dao.HobbyDAO;
import com.bc.hobby.vo.HobbyVO;
import com.bc.share.command.Command;

public class HobbyListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		List<HobbyVO> list = HobbyDAO.getHobbyList();
		
		String result = "{\"list\":[";
		for (HobbyVO vo : list) {
			result += "{";
			result += "\"h_idx\" : \""+vo.getH_idx()+"\",";
			result += "\"h_name\" : \""+vo.getH_name()+"\"";
			result += "},";
		}
		result = result.substring(0, result.length() - 1);
		result += "]}";
		
		return result;
	}

}
