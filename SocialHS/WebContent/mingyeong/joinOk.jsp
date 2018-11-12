<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../jieun/header_head.jsp" %>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<style>
	#joinok {
		padding: 150px;
	
	}
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: orangered;
	}


</style>
</head>
<%@ include file="../jieun/header.jsp" %>

<!-- jumbotron -->
<div >
	<div id="joinok" class="container text-center">
		<h2><b>회원가입이 완료되었습니다.</b></h2>
		<p class="lead"><font color="blue">
			<b>${joinInfo.getName() }</b></font>&nbsp;님 가입을 축하드립니다!<br>
				로그인 해주세요.</p>
		<hr>
		
		<form method="post">
			<input type="hidden" name="id" value="${joinInfo.id }">
		</form>
		<a href="index.jsp">메인화면으로 가기</a>
	</div>
	
</div>

<%@ include file="../jieun/footer.jsp" %>