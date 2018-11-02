<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="jieun/header.jsp"></jsp:include>
	<jsp:include page="jieun/footer.jsp"></jsp:include>
	<h1>작업환경 UTF-8 확인 부탁드립니다</h1>
	<h1>jsp, html 파일 생성시 DOCTYPE 확인 부탁드립니다</h1>
	hobbyMain 페이지 입니다.
	testeetses
	testestestt
	지역 id :  ${location }
	<c:forEach var = "vo" items="${SubLocation }">
		<ul>
			<li>${vo.getSl_name() }</li>
		</ul>
		  
	</c:forEach>
	<a href = "HobbyController?type=basket">basketball</a>
	
</body>
</html>