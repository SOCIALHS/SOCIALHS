<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<nav class="navbar navbar-dark bg-dark fixed-top">
		<a class="navbar-brand" style="color: aliceblue;" href="/SocialHS">SHAS (Social
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
