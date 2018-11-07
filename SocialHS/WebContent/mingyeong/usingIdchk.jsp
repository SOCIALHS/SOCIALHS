<%@page import="com.bc.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script>
	
	function selectOk(frm) {
		//현재 아이디 사용하기
		
		window.opener.document.getElementById("id").value = ${id };
		self.close();
		
	}
	
</script>
</head>
<body>
<div>
	<form method="post">
<%
	memberDAO dao = new memberDAO();
	boolean usingid = dao.idCheck(id);
	
	if (usingid==true) { 
%>
		<p>${id } 는 사용중인 아이디입니다.<br>
		다시 입력해주세요.</p><br>
		<input type="submit" value="닫기" onclick="self.close(); ">
		<!-- 아이디 <input type="text" name="checkid">
		<input type="button" value="중복체크" onclick="checkfrm(this.form)"> -->

<%
	} else {
		
%>
		${id } 는 사용가능한 아이디입니다.<br>
		<input type="submit" value ="다른 아이디 사용하기" onclick="self.close();">
		<input type="button" value="현재 아이디 선택" onclick="selectOk(this.form)">
		
<%
		
	}

%>
	
	</form>
</div>
</body>
</html>