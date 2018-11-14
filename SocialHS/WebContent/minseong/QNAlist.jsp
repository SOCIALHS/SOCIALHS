<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	}
%>

<title>Q&A 게시판</title>

</head>

<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../Admin/A_loginheader.jsp"%>
<%
	}
%>

<!--  <BODY>  -->

<div id="container">
	<h1 class="display-4 my-5 text-center">Q&A</h1>
	<hr>
	<a href="minseong/QNAwrite.jsp"><p class="lead text-center">게시물 작성하기</p></a>
	<table class="table mx-auto" style="width: 1000px;">
		<thead>
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
						<td><a href="QNA?type=QNAone&bb_idx=${vo.bb_idx }">${vo.getTitle() }</a></td>
						<td>${vo.getId() }</td>
						<td>${vo.getHit() }</td>
						<td>${vo.getGood() }</td>
						<td>${vo.getBad() }</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${empty list }">
				<tr scope="row">
					<td colspan="6">입력된 자료가 없습니다</td>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>

<%@ include file="../jieun/footer.jsp"%>










