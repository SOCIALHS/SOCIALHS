<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>Social Hobby & Study</title>
</head>

<body>
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
			<jsp:include page="wonho/sidebar.jsp"></jsp:include>
		</div>

		<div class="col-10">

			<div class="row d-flex justify-content-center">
				<!-- sub nav -->
				<div id = "test">
				<jsp:include page="dongwu/category.jsp"/>
				</div>

			</div>

			<div class="row d-flex justify-content-center">
				<!-- content -->
				<jsp:include page="dongwu/content.jsp"/>
			</div>

		</div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
		
</body>

</html>