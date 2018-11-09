<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	if (session.getAttribute("memberVO") == null) {
%>
<jsp:include page="../jieun/header_head.jsp"></jsp:include>
<%
	} else {
%>
<%-- <%@ include file="head.jsp" %> --%>
<jsp:include page="../head.jsp"></jsp:include>
<% 
	}
%>
<!-- <html> ~ <head> -->

<!-- **여기에 타이틀 넣기 -->
<title> 검색창 </title>
</head>
<%
	if (session.getAttribute("memberVO") == null) {
%>
	<jsp:include page="../jieun/header.jsp"></jsp:include>
<%
	} else {
%>
	<jsp:include page="../jieun/loginheader.jsp"></jsp:include>
<% 
	}
%>

<!-- <body> 태그 포함 -->

<!-- 밑에서 부터 body 임 -->
<%-- 검색창(글제목, 글내용, 작성자 검색) --%>

<h1>검색 결과</h1>
<div>
	<ul>
		<c:forEach var="e" items="${s_list }">
			<li>${e.hs }, ${e.id }, ${e.title }, ${e.content } </li>
		</c:forEach>
	</ul>
</div>


<!-- </body> </html> 포함 -->
<jsp:include page="../jieun/footer.jsp"></jsp:include>