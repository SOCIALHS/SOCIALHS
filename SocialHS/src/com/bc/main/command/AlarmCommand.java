package com.bc.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.main.dao.MainDAO;
import com.bc.share.command.Command;

public class AlarmCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		
		int msnChk = MainDAO.getMsnAlm("test");
		System.out.println("msnChk: "+ msnChk);
		int memChk = MainDAO.getMemAlm("test");
		System.out.println("memChk: "+ memChk);
		int alm = msnChk + memChk;
		
		
		return alm+"";
	}

}
