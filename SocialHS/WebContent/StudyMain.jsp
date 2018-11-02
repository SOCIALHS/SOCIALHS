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

<title>Hello, world!</title>
<style>
.list-group {
	float: left;
	width: 300px;
}

#page-content-wrapper {
	margin-left: 300px;
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

	<div class="category">
		<nav class="nav nav-pills flex-column flex-sm-row">
			<a class="flex-sm-fill text-sm-center nav-link active" href="#">Active</a>
			<a class="flex-sm-fill text-sm-center nav-link" href="#">Link</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Link</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Disabled</a>
		</nav>
		<nav class="nav nav-pills flex-column flex-sm-row">
			<a class="flex-sm-fill text-sm-center nav-link" href="#">Active</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Link</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Link</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Disabled</a>
		</nav>
		<nav class="nav nav-pills flex-column flex-sm-row">
			<a class="flex-sm-fill text-sm-center nav-link" href="#">Active</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Link</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Link</a> <a
				class="flex-sm-fill text-sm-center nav-link" href="#">Disabled</a>
		</nav>
	</div>


	<div id="wrapper">
		<!-- Sidebar -->
		<div class="list-group">
			<a href="#" class="list-group-item list-group-item-action active">
				Cras justo odio </a> <a href="#"
				class="list-group-item list-group-item-action">Dapibus ac
				facilisis in</a> <a href="#"
				class="list-group-item list-group-item-action">Morbi leo risus</a> <a
				href="#" class="list-group-item list-group-item-action">Porta ac
				consectetur ac</a> <a href="#"
				class="list-group-item list-group-item-action">Vestibulum at
				eros</a> <a href="#" class="list-group-item list-group-item-action">Dapibus
				ac facilisis in</a> <a href="#"
				class="list-group-item list-group-item-action">Morbi leo risus</a> <a
				href="#" class="list-group-item list-group-item-action">Porta ac
				consectetur ac</a> <a href="#"
				class="list-group-item list-group-item-action">Vestibulum at
				eros</a> <a href="#" class="list-group-item list-group-item-action">Dapibus
				ac facilisis in</a> <a href="#"
				class="list-group-item list-group-item-action">Morbi leo risus</a> <a
				href="#" class="list-group-item list-group-item-action">Porta ac
				consectetur ac</a> <a href="#"
				class="list-group-item list-group-item-action">Vestibulum at
				eros</a> <a href="#" class="list-group-item list-group-item-action">Dapibus
				ac facilisis in</a> <a href="#"
				class="list-group-item list-group-item-action">Morbi leo risus</a> <a
				href="#" class="list-group-item list-group-item-action">Porta ac
				consectetur ac</a> <a href="#"
				class="list-group-item list-group-item-action">Vestibulum at
				eros</a> <a href="#" class="list-group-item list-group-item-action">Dapibus
				ac facilisis in</a> <a href="#"
				class="list-group-item list-group-item-action">Morbi leo risus</a> <a
				href="#" class="list-group-item list-group-item-action">Porta ac
				consectetur ac</a> <a href="#"
				class="list-group-item list-group-item-action">Vestibulum at
				eros</a>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		지역 id : ${location }
		<c:forEach var="vo" items="${SubLocation }">
		${vo.getSl_name() } , 
	</c:forEach>
		<a href="HobbyController?type=basket">basketball</a>
		<div id="page-content-wrapper">
			<div class="card-group">
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This card has supporting text below as a
							natural lead-in to additional content.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This card has
							even longer content than the first to show that equal height
							action.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="card-group">
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This card has supporting text below as a
							natural lead-in to additional content.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This card has
							even longer content than the first to show that equal height
							action.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<div class="card-group">
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This content is
							a little bit longer.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This card has supporting text below as a
							natural lead-in to additional content.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
				<div class="card">
					<img class="card-img-top" src=".../100px180/" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<p class="card-text">This is a wider card with supporting text
							below as a natural lead-in to additional content. This card has
							even longer content than the first to show that equal height
							action.</p>
						<p class="card-text">
							<small class="text-muted">Last updated 3 mins ago</small>
						</p>
					</div>
				</div>
			</div>
			<nav aria-label="Page navigation example" class="page_nav">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->

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