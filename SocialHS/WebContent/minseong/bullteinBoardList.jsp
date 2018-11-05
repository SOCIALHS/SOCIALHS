<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<style>
	
</style>
<body>
<h2>공지 게시판</h2>
	<button><a href="StudyMainController?type=bullteinWrite">공지 작성</a></button>
	<table border="1">
		<thead>
			<tr>
				<th>no</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty list }">
			<c:forEach var="st" items="${list }">
			<tr>
				<td>${st.getB_idx() }</td>
				<td><a href="StudyController?type=bulltein&${st.b_idx }">${st.getTitle() }</a></td>
				<td>${st.getId() }</td>
				<td>${st.getRegdate }</td>
				<td>${st.getHit() }</td>
				<td>${st.Point() }</td>
			</tr>
		</c:forEach>
		</c:if>
		</tbody>
	</table>
</body>
</html>