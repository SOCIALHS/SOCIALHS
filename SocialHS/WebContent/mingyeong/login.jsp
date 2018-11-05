<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
	.btn {
		width: 100%;
		border: 2px solid gold;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		background-color: white
		
	}
	.btn:hover {
		border: 2px solid gold;
		background-color: gold;
		color: black;
	}
	#login {
		margin: 70px;
	}
	#menu {
		font-size: 15px;
	}

</style>
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
</script>
</head>
<body>
<div id="login">
	<a href="../HobbyMain.jsp">HOBBY</a>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
	<a href="../StudyMain.jsp">STUDY</a>
	<br>
	<br>
<form method="post">	
	<table>
		<thead>
			<th>회원 로그인</th>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="id" placeholder="아이디" size="45"></td>
			</tr>
			<tr>
				<td><input type="password" name="pw" placeholder="비밀번호" size="45"></td>
			</tr>
			<tr>
				<td>아이디 또는 비밀번호를 다시 확인하세요.</td>
			</tr>
			<tr>
				<td>
					<input class="btn" type="button" value="로그인"
									onclick="login(this.form)">
					<input type="hidden" name="loginchk" value="chk">
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>
<hr>

<div id="menu">
	<a href="join.jsp">회원가입</a>&nbsp;|&nbsp;
	<a href="findid.jsp">아이디찾기</a>&nbsp;|&nbsp;
	<a href="findpw.jsp">비밀번호찾기</a>
</div>

</body>
</html>