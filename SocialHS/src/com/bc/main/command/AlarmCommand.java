package com.bc.main.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.main.dao.MainDAO;
import com.bc.main.vo.BoardVO;
import com.bc.main.vo.CommentVO;
import com.bc.main.vo.MessengerVO;
import com.bc.member.memberVO;
import com.bc.share.command.Command;

public class AlarmCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		List<MessengerVO> msnAlm;
		List<BoardVO> memAlm;
		List<CommentVO> comAlm;
		memberVO vo = (memberVO)session.getAttribute("memberVO");
		
		System.out.println("세션 id: "+ vo.getId());
		msnAlm = MainDAO.getMsnAlm(vo.getId());
		System.out.println("msnAlm: "+ msnAlm);
		memAlm = MainDAO.getMemAlm(vo.getId());
		System.out.println("memAlm: "+ memAlm);
		comAlm = MainDAO.getComAlm(vo.getId());
		System.out.println("comAlm: "+ comAlm);
		
		int sumMsn = 0;
		int sumMem = 0;
		int sumCom = 0;
		int sum = 0;
		
		String result = "{";
		if (msnAlm.size() != 0) {
		result += "\"msnAlm\":[";
			for (MessengerVO msn : msnAlm) {
				sumMsn += msn.getChk();
				result += "{";
				result += "\"send_id\" : \""+ msn.getSend_id() +"\",";
				result += "\"title\" : \""+ msn.getTitle() +"\",";
				result += "\"content\" : \""+ msn.getContent() +"\"";
				result += "},";
			}
			result = result.substring(0, result.length() - 1);
			result += "],";
		}
		
		if (memAlm.size() != 0) {
			result += "\"memAlm\":[";
			for (BoardVO board : memAlm) {
				sumMem += board.getChk();
				result += "{";
				result += "\"title\" : \""+ board.getTitle() +"\"";
				result += "},";
			}
			result = result.substring(0, result.length() - 1);
			result += "],";
		}
		
		if (comAlm.size() != 0) {
		result += "\"comAlm\":[";
		for (CommentVO com : comAlm) {
			sumCom += com.getChk();
			result += "{";
			result += "\"title\" : \""+ com.getTitle() +"\",";
			result += "\"content\" : \""+ com.getContent() +"\"";
			result += "},";
		}
			result = result.substring(0, result.length() - 1);
			result += "],";
		}
		sum = sumMsn + sumMem + sumCom;
		result += "\"almCnt\":\""+sum+"\"";
		
		System.out.println("sum: "+ sum);
		result += "}";
		
		System.out.println(result);
		
		
		return result;
//		return sum+"";
	}

}
