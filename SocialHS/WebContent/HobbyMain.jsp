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
<%@ include file="wonho/sidebar_head.jsp"%>
<%@ include file="dongwu/category_head.jsp"%>
<%@ include file="dongwu/content_head.jsp"%>
<title>Social Hobby & Study</title>
<!-- head 태그 -->

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
<!-- <body> -->

<div class="row bg-light">

	<nav class="navbar navbar-expand-lg navbar-light bg-light ml-auto">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">

		</div>
	</nav>
</div>

<div class="row">
	<div class="col-2">
		<!-- aside -->
		<%@ include file="wonho/sidebar_body.jsp"%>
	</div>

	<div class="col-10">

		<!-- 이 밑에 DIV에 카테고리 출력 -->
		<div class="row d-flex justify-content-center">
			<!-- sub nav -->
			<div id="category" style="width: 100%;"></div>
			<%-- <%@ include file="dongwu/category.jsp" %> --%>

		</div>
		<!-- <div class="row d-flex justify-content-center"> -->
		<!-- content -->
		<%@ include file="dongwu/content_body.jsp"%>
		<!-- </div> -->

	</div>

</div>

<%@ include file="jieun/footer.jsp"%>