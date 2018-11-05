<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	header {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		padding: 10px;
		background: Black;
		color: white;
		font: 0.8em arial, sans-serif;
	}
	input[type=text], input[type=password] {
		width: 10%;
	 	box-sizing: border-box;
	 	background: black;
   		border: none;
   		border-bottom: 2px solid white;
   		color:white;
	}
	input[type=button]{
	  background:Black;
	  color:white;
	  font: 1em arial, sans-serif;
	  border-color: white;
	  border-style: solid;
	  height:23px;
	  padding:0 1em;
	  outline:none;

	}
	input[type=button]:hover{
	  background:gray;
	  color:#fff;
	}
	#start{
		margin-top: 45px;
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
	
	function join(frm) {
		frm.action = "memberController?type=join";
		frm.submit();
	}
</script>

</head>
<body>
	<header>
		<nav>
		<form method="post" >
			ID <input type="text" name="id">
			&nbsp;&nbsp; PW <input type="password" name="pw"> 
			<input type="button" value="LOGIN" onclick="login(this.form)">
			<input type="button" value="JOIN" onclick="join(this.form)">
			
			<input type="hidden" name="loginchk" value="chk">
		</form>
		</nav>
		<!-- 
			<b>sss</b>님 이 로그인 하였습니다.
		 -->
	</header>
	<div id="start"></div>
</body>
</html>