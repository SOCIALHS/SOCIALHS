<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="head.jsp"></jsp:include>
    <title>Social Hobby & Study</title>
    <!-- head 태그 -->
</head>
<%
	if (session.getAttribute("memberVO") == null) {
%>
	<jsp:include page="jieun/header.jsp"></jsp:include>
<%
	} else {
%>
	<jsp:include page="jieun/loginheader.jsp"></jsp:include>
<% 
	}
%>
<!-- body 태그 -->
	
	<!-- 
	지역 id :  ${location }
	<c:forEach var = "vo" items="${SubLocation }">
		<ul>
			<li>${vo.getSl_name() }</li>
		</ul>
		  
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
			<jsp:include page="wonho/sidebar.jsp"></jsp:include>
		</div>

		<div class="col-10">

			<div class="row d-flex justify-content-center">
				<!-- sub nav -->
				<jsp:include page="dongwu/category.jsp"></jsp:include>

			</div>

			<div class="row d-flex justify-content-center">
				<!-- content -->
				<jsp:include page="dongwu/content.jsp"></jsp:include>
			</div>

		</div>

	</div>

	<jsp:include page="jieun/footer.jsp"></jsp:include>