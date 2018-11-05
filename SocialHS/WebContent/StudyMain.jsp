<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<jsp:include page="jieun/header.jsp"></jsp:include>
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
					<li class="nav-item"><a class="nav-link" href="#">공지</a></li>
					<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">질문방</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 마이페이지 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">내정보</a> <a
								class="dropdown-item" href="#">로그아웃</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">고객센터</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>

	<div class="row">
		<div class="col-3">
			<!-- aside -->
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseOne" aria-expanded="false"
								aria-controls="collapseOne">서울</button>
						</h5>
					</div>

					<div id="collapseOne" class="collapse show"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseTwo" aria-expanded="false"
								aria-controls="collapseTwo">경기</button>
						</h5>
					</div>

					<div id="collapseTwo" class="collapse" aria-labelledby="headingOne"
						data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseThree" aria-expanded="false"
								aria-controls="collapseThree">경남</button>
						</h5>
					</div>

					<div id="collapseThree" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseFour" aria-expanded="false"
								aria-controls="collapseFour">경북</button>
						</h5>
					</div>

					<div id="collapseFour" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseFive" aria-expanded="false"
								aria-controls="collapseFive">충남</button>
						</h5>
					</div>

					<div id="collapseFive" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseSix" aria-expanded="false"
								aria-controls="collapseSix">충북</button>
						</h5>
					</div>

					<div id="collapseSix" class="collapse" aria-labelledby="headingOne"
						data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseSeven" aria-expanded="false"
								aria-controls="collapseSeven">전남</button>
						</h5>
					</div>

					<div id="collapseSeven" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseEight" aria-expanded="false"
								aria-controls="collapseEight">전북</button>
						</h5>
					</div>

					<div id="collapseEight" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseNine" aria-expanded="false"
								aria-controls="collapseNine">강원</button>
						</h5>
					</div>

					<div id="collapseNine" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#collapseTen" aria-expanded="false"
								aria-controls="collapseTen">제주</button>
						</h5>
					</div>

					<div id="collapseTen" class="collapse" aria-labelledby="headingOne"
						data-parent="#accordionExample">
						<ul class="list-group">
							<li class="list-group-item active">Cras justo odio</li>
							<li class="list-group-item">Dapibus ac facilisis in</li>
							<li class="list-group-item">Morbi leo risus</li>
							<li class="list-group-item">Porta ac consectetur ac</li>
							<li class="list-group-item">Vestibulum at eros</li>
						</ul>
					</div>
				</div>

			</div>
		</div>

		<div class="col-9">

			<div class="row">
				<!-- sub nav -->
				<div class="dropdown m-2">
					<button class="btn btn-light  btn-lg dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">습관스터디</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">아침출첵</a> <a
							class="dropdown-item" href="#">저녁출첵</a>
					</div>
				</div>

				<div class="dropdown m-2">
					<button class="btn btn-light  btn-lg dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">외국어스터디</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">영어</a> <a class="dropdown-item"
							href="#">일본어</a> <a class="dropdown-item" href="#">중국어</a>
					</div>
				</div>

				<div class="dropdown m-2">
					<button class="btn btn-light  btn-lg dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">기타스터디</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">주식</a> <a class="dropdown-item"
							href="#">면접</a> <a class="dropdown-item" href="#">주짓수</a>
					</div>
				</div>

			</div>

			<div class="row">
				<!-- content -->
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