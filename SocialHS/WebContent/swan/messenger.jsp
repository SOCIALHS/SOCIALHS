<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
<style>
	table{
		border: 1px solid black;
	}
</style>
</head>
<body>
	<h1>여기는 쪽지 페이지 임돠</h1>


	<table>
		<thead>
		<tr>
			<th>보낸이</th>
			<th>제목</th>
			<th>발송일</th>
			<th>확인여부</th>
		</tr>
		</thead>
	<c:forEach var="list" items="${msnList }">
		<tr>
			<td>${list.send_id }</td>
			<td><a href="MessengerController?type=oneList&ms_idx=${list.ms_idx }">${list.title }</a></td>
			<td>${list.regdate.substring(0,10) }</td>
			<c:if test="${list.chk == 1 }">
				<td>확인 안함</td>
			</c:if>
			<c:if test="${list.chk == 0 }">
				<td>확인함</td>
			</c:if>
		</tr>
	</c:forEach>
	</table>
</body>
</html>