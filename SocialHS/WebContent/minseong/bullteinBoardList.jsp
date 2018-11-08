<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시판</title>
<style>
	#container {
		width: 512px; margin: auto;
	}
	#container h2 { text-align: center; }
	#container p { text-align: center; }
	#container table {
		width: 500px; padding: 0 5px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	#container th, td { border: 1px solid black; }
	#container table th {
		background-color: #9cf;
	}
	#container table td {
		text-align: left;
	}
	#container p > a {
		text-decoration: none;
		font-weight: bold;
	}
	#container .center { text-align: center; }
	
</style>
</head>
<body>

<div id="container">
	<h2>공지사항</h2>
	<hr>
	<p>[<a href="BullteinController?type=bullteinWrite&bb_idx=${vo.bb_idx }">게시물 작성</a>]</p>
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>GOOD</th>
				<th>BAD</th>
			</tr>
		</thead>
		<tbody>
	
		<c:if test="${not empty list }">	
			<c:forEach var="vo" items="${list }">
			<tr>
				<td>${vo.getBb_idx() }</td>
				<td><a href="BullteinController?type=bullteinOne&bb_idx=${vo.bb_idx }">${vo.getTitle() }</a></td>
				<td>${vo.getId() }</td>
				<td>${vo.getHit() }</td>
				<td>${vo.getGood() }</td>
				<td>${vo.getBad() }</td>
			</tr>
			</c:forEach>
		</c:if>			
	
		<c:if test="${empty list }">		
			<tr>
				<td colspan="7">입력된 자료가 없습니다</td>
			</tr>
		</c:if>		
		</tbody>
	</table>
</div>

</body>
</html>










