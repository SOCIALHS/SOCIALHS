<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp" %>
<%
	} else {
%>
<%@ include file="head.jsp" %>
<% 
	}
%>
    <title>Social Hobby & Study</title>
    <!-- head 태그 -->

</head>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp" %>
<%
	} else {
%>
<%@ include file="jieun/loginheader.jsp" %>
<% 
	}
%>
<!-- body 태그 -->
	
	
    <!-- jumbotron -->
    <style>
.location {
	margin: 10px;
}
</style>
</head>

<!-- body -->
<div class="jumbotron jumbotron-fluid">
	<!-- jumbotron -->
	<div class="container text-center">
		<h1 class="display-4">원하는 지역을 선택해주세요.</h1>
		<p class="lead">해당 지역에 개설되어 있는 스터디 또는 취미 모임을 보실 수 있습니다.</p>
		<hr class="my-4">
		<div class="row">
			<div class="col">
				<span class="align-text-bottom">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=01" role="button">서울</a>
					</span>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=02" role="button">경기</a>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=03" role="button">강원</a>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=04" role="button">충북</a>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=05" role="button">충남</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=06" role="button">전북</a>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=07" role="button">전남</a>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=08" role="button">경북</a>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=09" role="button">경남</a>
			</div>
			<div class="col">
				<a class="btn btn-danger btn-lg btn-block location"
					href="LocationController?hs=${hs }&location=10" role="button">제주</a>
			</div>
		</div>
	</div>
</div>
    <%@ include file="jieun/footer.jsp" %>