<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp"%>
<%
	} else {
%>
<%@ include file="head.jsp"%>
<%
	}
%>

<title>[A] 소셜 하비 앤 스터디</title>

<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp"%>
<%
	} else {
%>
<%@ include file="jieun/loginheader.jsp"%>
<%
	}
%>
</head>

<!-- body -->
<div class="jumbotron jumbotron-fluid">

	<!-- picture slide -->
	<div id="carouselExampleSlidesOnly" class="carousel slide mx-auto"
		style="width: 800px;" data-ride="carousel" data-interval="3000">
		
	</div>
	
	<!-- jumbotron -->
	<div class="container text-center mt-3">
	</div>
	
	
	<div id ="infohead">
		<ul class="tab nav mx-auto my-2" >
			<li class="tablink current nav-item" data-tab="allList">글목록</li>
			<span>&nbsp;&nbsp;</span>
			<li class="tablink nav-item" data-tab="allmemberInfo">회원정보 보기</li>
		</ul>
	</div>
	
	<%-- 글목록 --%>
	<div id="allList" class="tabcontent current">
		<table class="table my-2 mx-auto text-center">
			<thead>
				<tr>
					<th class="num">NO</th>
					<th class="no">게시판번호</th>
					<th class="category">카테고리</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>301</td>
					<td>BASEBALL</td>
					<td>[신촌] 야구하실분 모집합니다</td>
					<td>test</td>
					<td>18/11/06</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6" class="right">
						<a><b>더보기&gt;</b></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div> <%-- 글목록 끝 --%>
	
	<%-- 회원정보 --%>
	<div id="allmemberInfo" class="tabcontent">
		<table class="table my-2 mx-auto text-center">
			<thead>
				<tr>
					<th class="num">NO</th>
					<th>아이디</th>
					<th>이름</th>
					<th>가입날짜</th>
					<th>등급</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>test</td>
					<td>테스트</td>
					<td>18/11/02</td>
					<td>0</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5" class="right">
						<a><b>더보기&gt;</b></a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div> <%-- 회원정보 보기 끝 --%>
	
</div>

<%@ include file="jieun/footer.jsp"%>