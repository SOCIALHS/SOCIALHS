<%@page import="com.bc.member.memberDAO"%>
<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.admin.A_AllBoardVO"%>
<%@page import="com.bc.admin.AdminDAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.member.Paging"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<%
	if (session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header.jsp"%>
<%	} else {
%>		<%@ include file="A_loginheader.jsp"%>
<%	}
%>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<meta charset="UTF-8">
<title>[A] 카테고리 추가</title>
<style>

</style>
<link href="css/A_morepage.css" rel="stylesheet" type="text/css">

	<jsp:include page="function.jsp"></jsp:include>

</head>
<body>
<div id="adminPage" class="jumbotron jumbotron-fluid">
	
	<jsp:include page="infohead.jsp"></jsp:include>

   <%--카테고리 추가 --%>
	<div id="categoryAdd">
		<form method="post" class="form-horizontal" enctype="multipart/form-data">
			<div class="form-group">
         	<label for="hobbyStudy" class="col-sm-2 control-label">HobbyStudy</label>
           		<select name = "bbs_type" id = "hobbyStudy" class="form-control">
                  <option value = "300">hobby</option>
                  <option value = "700">study</option>
               </select>
         	</div>
      		
      		<div class="form-group">
         	<label for="bbs_name">카테고리 이름</label>
         		<input type="text" name="bbs_name" id = "bbs_name">
      		</div>
      		
      		<div class="form-group">
         	<label for="f_name">카테고리 사진파일</label>
         		<input type="file" name="f_name" id= "f_name">
       		</div>
      			<input type="button" class="btn btn-primary" value="카테고리 추가"
         				onclick="file_up(this.form)">
      </form>
      
	</div>
	
</div>

</body>
</html>