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
</head>
<body>
	<header>
		<nav> 
			ID <input type="text" name="id">
			&nbsp;&nbsp; PW <input type="password" name="pw"> 
			<input type="button" value="LOGIN">
			<input type="button" value="JOIN">
		</nav>
	</header>
	<div id="start"></div>
</body>
</html>