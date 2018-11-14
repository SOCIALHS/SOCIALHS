<%@page import="com.bc.member.Paging"%>
<%@page import="com.bc.minseong.command.FreeBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../head.jsp"%>

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
</head>
<body>
	<div id="container">
		<h1 class="display-4 my-5 text-center">자유게시판</h1>
		<hr>
		<p>
			<button type="button" class="btn btn-info"
				style="margin-left: 1300px;"
				onclick="location.href='minseong/freeBoardWrite.jsp'">게시물
				작성하기</button>
		</p>
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
							<td><a
								href="FreeController?type=freeOne&bb_idx=${vo.bb_idx }">${vo.getTitle() }</a></td>
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
</body>
</html>




<%@ include file="../jieun/footer.jsp"%>







