<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.bc.hobby.vo.HobbyBoardVO"%>
<%
	List<HobbyBoardVO> hobbyList = (List<HobbyBoardVO>) request.getAttribute("HobbyList");
	System.out.println("hobbyList check : " + hobbyList);
	pageContext.setAttribute("hobbyList", hobbyList);
%>

<style type="text/css">
.positionTop {
	top: 50px;
	display: inline-block;
}

.box_width {
	width: 300px;
}
</style>