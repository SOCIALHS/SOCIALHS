<%@page import="com.bc.hobby.vo.HobbyBoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<HobbyBoardVO> hobbyList = (List<HobbyBoardVO>) request.getAttribute("HobbyList");
	System.out.println("hobbyList check : " + hobbyList);
	pageContext.setAttribute("hobbyList", hobbyList);
%>
<!doctype html>
<html lang="en">
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
<style type="text/css">
	.positionTop{
		top : 50px;
		display: inline-block;
	}
	.box_width{
		width : 300px;
	}
</style>
</head>
<body>
	<div class="empty">
	</div>
	<c:forEach var="list" items="${hobbyList }">
		<div class="card text-center my-2 mx-2 positionTop box_width" >
			<div class="card-header">${list.bbs_name }</div>
			<div class="card-body">
				<h5 class="card-title">${list.title }</h5>
				<p class="card-text">${list.id }</p>
				<hr>
				<p class="card-text">${list.req_member }</p>
				<p class="card-text">${list.cur_member }</p>
				<hr>
				<p class="card-text">${list.place }</p>
				<p class="card-text">${list.time }</p>
				<a href="HobbyController?type=write&bb_idx=${list.bb_idx }" class="btn btn-primary">상세보기</a>
			</div>
			<div class="card-footer text-muted">2 days ago</div>
		</div>
	</c:forEach>



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