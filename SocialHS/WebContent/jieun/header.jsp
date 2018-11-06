<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<script>
	function login(frm) {
		
		if (!frm.id.value) {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}
		
		if (!frm.pw.value) {
			alert("비밀번호를 입력하세요.");
			frm.pw.focus();
			return false;
		}
		
		frm.action = "memberController?type=login";
		frm.submit();
	}
	
	function join(frm) {
		frm.action = "memberController?type=join";
		frm.submit();
	}
</script>

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
	<nav class="navbar navbar-dark bg-dark fixed-top">
		<a class="navbar-brand" style="color: aliceblue;">SHAS (Social
			Hobby & Study)</a>
		<form class="form-inline my-2" method="post">
			<div class="form-group mx-sm-3">
				<label for="inputId" class="sr-only">Id</label> <input type="text"
					class="form-control" id="inputId" name="id" placeholder="Id">
			</div>
			<div class="form-group mx-sm-3">
				<label for="inputPassword" class="sr-only">Password</label> <input
					type="password" class="form-control" id="inputPassword" name="pw"
					placeholder="Password">
			</div>
			<button type="button" class="btn btn-light mr-3" onclick="login(this.form)">로그인</button>
			<button type="button" class="btn btn-light" onclick="join(this.form)">회원가입</button>
		</form>
	</nav>

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