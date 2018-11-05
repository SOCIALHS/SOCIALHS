<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession session = request.getSession();
	String log_check = session.getAttribute("log_check");
	if(log_check.equals("false")){
%>
		<jsp:include page="jieun/header.jsp"></jsp:include>
<%
	}else{
%>
		<jsp:include page="jieun/loginHeader.jsp"></jsp:include>
<%	
	}

%>