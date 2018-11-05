<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
</head>
<body>
<div id="joinok">
	<p><font size="4"><b>회원가입이 완료되었습니다.</b></font><br>
	<font color="blue"><b>${memberVO.getName() }</b></font> 님 가입을 축하드립니다!<br>
	로그인 해주세요.</p>
	<hr>
	
	<form method="get">
		<input type="hidden" name="id" value="${memberVO.getId() }">
	</form>
</div>
<div>
	<a href="index.jsp">home</a>
</div>

</body>
</html>