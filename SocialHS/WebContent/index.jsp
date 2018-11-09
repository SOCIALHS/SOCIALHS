<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- body 태그 -->

<!-- jumbotron -->
<div class="jumbotron jumbotron-fluid">
	<div id="carouselExampleSlidesOnly" class="carousel slide mx-auto"
		style="width: 800px;" data-ride="carousel" data-interval="3000">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="imgs/index1.jpg" alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index2.jpg" alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index3.jpg" alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index4.jpg" alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index5.jpg" alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index6.jpg" alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index7.jpg" alt="Third slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="imgs/index8.jpg" alt="Third slide">
			</div>
		</div>
	</div>
	<div class="container text-center mt-3">
		<h1 class="display-3">소셜 하비 앤 스터디</h1>
		<p class="lead">원하는 취미 모임, 필요한 스터디 모임이 여기에</p>
		<hr class="my-4">
		<p class="lead">취미나 스터디 모임에 참여하고 싶으시면 아래 버튼을 클릭해 주세요.</p>
		<a class="btn btn-danger btn-lg mx-3 my-4"
			href="MainController?type=hobby" style="padding: 25px 100px;"
			role="button">취미</a> <a class="btn btn-danger btn-lg mx-3 my-4"
			href="MainController?type=study" role="button"
			style="padding: 25px 100px;">스터디</a>
	</div>
</div>


<%@ include file="jieun/footer.jsp"%>