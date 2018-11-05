<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
</head>
<body>
<%
	if(session.getAttribute("memberid") == null) {
%>
	<jsp:include page="jieun/header.jsp"></jsp:include>
<%
	}else{
%>
	<jsp:include page="jieun/loginheader.jsp"></jsp:include>
<% 
	}
%>
	

	<!-- jumbotron -->
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<br><br><br>
			<h1 class="display-4">Social Hobby & Study</h1>
			<p class="lead">소셜 하비 앤 스터디에 오신 것을 환영합니다.</p>
			<hr class="my-4">
			<p class="lead">취미나 스터디 모임에 참여하고 싶으시면 아래 버튼을 클릭해 주세요.</p>
			<a class="btn btn-dark btn-lg" href="MainController?type=hobby" role="button">Hobby</a> <a
				class="btn btn-dark btn-lg" href="MainController?type=study" role="button">Study</a>
		</div>
	</div>

	<div id="carouselExampleSlidesOnly" class="carousel slide"
		data-ride="carousel" data-interval="3000">
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
		</div>
	</div>
	</div>



	<jsp:include page="jieun/footer.jsp"></jsp:include>

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

