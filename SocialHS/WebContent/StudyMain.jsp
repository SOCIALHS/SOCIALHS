<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp"%>
<%
	} else {
%>
<%@ include file="head.jsp"%>
<%
	}
%>
<title>Social Hobby & Study</title>


</head>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp"%>
<%
	} else {
%>
<%@ include file="jieun/loginheader.jsp"%>
<%
	}
%>


	<br><br><br>
	
	<!-- 
	지역 id :  ${location }
	<c:forEach var = "vo" items="${SubLocation }">
		${vo.getSl_name() } , 
	</c:forEach>
	<a href = "HobbyController?type=basket">basketball</a>
	 -->

	<div class="row bg-light">
		
		<nav class="navbar navbar-expand-lg navbar-light bg-light ml-auto">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">질문방</a></li>
				</ul>
			</div>
		</nav>
	</div>

	<div class="row">
		<div class="col-2">
			<!-- aside -->
		<%@ include file="wonho/sidebar.jsp"%>		
		</div>

		<div class="col-10">

			<div class="row d-flex justify-content-center">
				<!-- sub nav -->
				<div id = "test">test</div>
				<%@ include file="dongwu/category.jsp"%>

			</div>

			<div class="row d-flex justify-content-center">
				<!-- content -->
			<%@ include file="dongwu/content.jsp"%>
			</div>

		</div>

	</div>

<%@ include file="jieun/footer.jsp"%>
