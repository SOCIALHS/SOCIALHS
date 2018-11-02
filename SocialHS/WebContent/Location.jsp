<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String hs = (String)request.getAttribute("hs_flag");
	System.out.println("hs : "+ hs);
	session.setAttribute("hs", hs);
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	<div>${hs }</div>
	<table id = "body">
		<tbody>
			<tr>
				<td><div class = 'area'><a href = "LocationController?location=1">����</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=2">��⵵</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=3">������</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=4">��û�ϵ�</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=5">��û����</a></div></td>
			</tr>
			<tr>
				<td><div class = 'area'><a href = "LocationController?location=8">���ϵ�</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=9">��󳲵�</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=6">����ϵ�</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=7">���󳲵�</a></div></td>
				<td><div class = 'area'><a href = "LocationController?location=10">���ֵ�</a></div></td>
			</tr>
		</tbody>
	</table>
	
</body>
</html>