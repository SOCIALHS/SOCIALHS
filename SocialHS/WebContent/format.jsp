<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="head.jsp"></jsp:include>
    <title>Social Hobby & Study</title>
</head>				<!-- head 태그 끝 -->
    
<%
	if (session.getAttribute("memberVO") == null) {
%>
	<jsp:include page="jieun/header.jsp"></jsp:include>
<%
	} else {
%>
	<jsp:include page="jieun/loginheader.jsp"></jsp:include>
<% 
	}
%>
<!-- body 태그 시작 -->













<jsp:include page="jieun/footer.jsp"></jsp:include>
<!-- body, html 태그 끝 -->