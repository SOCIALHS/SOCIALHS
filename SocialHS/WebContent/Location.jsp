<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String hs = (String) request.getAttribute("hs_flag");
	System.out.println("hs : " + hs);
	session.setAttribute("hs", hs);
%>
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

<title>location</title>
</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-light bg-light"> <a
		class="navbar-brand">소셜 하비 앤 스터디</a>
	<form class="form-inline">
		<a class="navbar_btn" href="#">로그인</a> <a class="navbar_btn" href="#">회원가입</a>
	</form>
	</nav>

	<div>${hs }</div>
	<!-- Location Grid Section -->
	<section class="portfolio" id="portfolio">
	<div class="container">
		<h2 class="text-center text-uppercase text-secondary mb-0">지역</h2>
		<hr class="star-dark mb-5">
		<div class="row">
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: red">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							경기</div>
					</div> <img class="img-fluid" src="img/portfolio/cake.png" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: red">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							서울</div>
					</div> <img class="img-fluid" src="img/portfolio/cabin.png" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: red">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							경기</div>
					</div> <img class="img-fluid" src="img/portfolio/cake.png" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: red">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							충북</div>
					</div> <img class="img-fluid" src="img/portfolio/circus.png" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: orange">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							충남</div>
					</div> <img class="img-fluid" src="img/portfolio/game.png" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: red">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							경기</div>
					</div> <img class="img-fluid" src="img/portfolio/cake.png" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: orange">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							강원</div>
					</div> <img class="img-fluid" src="img/portfolio/safe.png" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-3">
				<a class="portfolio-item d-block mx-auto" href="#"
					style="background-color: orange">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							경북</div>
					</div> <img class="img-fluid" src="img/portfolio/submarine.png" alt="">
				</a>
			</div>

		</div>
	</div>
	</section>

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

