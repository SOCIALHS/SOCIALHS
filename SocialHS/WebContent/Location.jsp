<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String hs = (String)request.getAttribute("hs_flag");
	System.out.println("hs : "+ hs);
	session.setAttribute("hs", hs);
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#body{
		margin : auto;
		width : 80%;
		text-align : center;
	}
	.area{
		border : 1px solid black;
		display : inline-block;
		font-size : 1.2em;
		padding : 10px 10px;
		border-radius : 10%;
		background-color : #444;
	}
	a{
		text-decoration: none;
		color : white;
	}
	.area:hover{
		opacity: 0.3;
	}
</style>
</head>
<body>
	<jsp:include page="jieun/header.jsp"></jsp:include>
	<jsp:include page="jieun/footer.jsp"></jsp:include>
	<div>${hs }</div>
	<table id = "body">
		<tbody>
			<tr>
				<td><div class = 'area'><a href = "LocationController?location=1">서울</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=2">경기도</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=3">강원도</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=4">충청북도</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=5">충청남도</a></div></td>
			</tr>
			<tr>
				<td><div class = 'area'><a href = "LocationController?location=8">경상북도</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=9">경상남도</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=6">전라북도</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=7">전라남도</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=10">제주도</a></div></td>
			</tr>
		</tbody>
	</table>
	
</body>
</html>
