<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>		<%@ include file="../head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>		<%@ include file="../head.jsp"%>
<%
	} 
%>

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
	#container th, td { border: 1px solid gray; }
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

<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>		<%@ include file="../jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>		<%@ include file="../Admin/A_loginheader.jsp"%>
<%
	} 
%>

<!--  <BODY>  -->

<div id="container">
	<h2>공지사항</h2>
	<hr>
	<p>[<a href="BullteinController?type=bullteinWrite&bb_idx=${vo.bb_idx }">게시물 작성</a>]</p>
	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">조회수</th>
				<th scope="col">GOOD</th>
				<th scope="col">BAD</th>
			</tr>
		</thead>
		<tbody>
	
		<c:if test="${not empty list }">	
			<c:forEach var="vo" items="${list }">
			<tr>
				<td scope="row">${vo.getBb_idx() }</td>
				<td><a href="BullteinController?type=bullteinOne&bb_idx=${vo.bb_idx }" role="button">${vo.getTitle() }</a></td>
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

<%@ include file="../jieun/footer.jsp"%>










