<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>소셜 하비 앤 스터디</title>
<style>
.navbar_btn {
	margin-right: 10px;
}

#container {
	position: absolute;
	width: 100%;
}

#studyBtn {
	position: relative;
	left: 500px;
}

#hobbyBtn {
	position: relative;
}

#jumbo_title {
	margin-top: 70px;
	text-align: center;
}

#jumbo_subtitle {
	margin-top: 30px;
	text-align: center;
}

.jumbo_btn {
	margin: 20px 30px 100px 30px;
	padding: 40px 80px 40px 80px;
}
</style>
</head>

<body>
	<!-- Navbar -->
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand">소셜 하비 앤 스터디</a>
		<form class="form-inline">
			<a class="navbar_btn" href="#">로그인</a> <a class="navbar_btn" href="#">회원가입</a>
		</form>
	</nav>

	<!-- Jumbotron -->
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1 class="display-4" id="jumbo_title">
				소셜 하비 앤 스터디 <br> Welcome to<br> Social Hobby & Study
			</h1>
			<p class="lead" id="jumbo_subtitle">소셜 하비 앤 스터디에 오신 여러분들 환영합니다.</p>
			<div class="text-center">
				<a href="MainController?type=hobby"><button type="button"
						class="btn btn-lg bg-warning text-dark jumbo_btn">취미(Hobby)</button></a>
				<a href="MainController?type=study">
					<button type="button"
						class="btn btn-lg bg-success text-white jumbo_btn">스터디(Study)</button>
				</a>
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
