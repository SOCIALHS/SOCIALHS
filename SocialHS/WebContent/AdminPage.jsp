<%@page import="java.util.List"%>
<%@page import="com.bc.admin.AdminDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.admin.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	if (session.getAttribute("AdminVO") == null) {
%>		<%@ include file="jieun/header_head.jsp"%>
<%	} else {
%>		<%@ include file="head.jsp"%>
<%	}
%>

<%	// ***** ***** ***** ***** ***** ***** ***** *****
	AdminVO avo = (AdminVO) session.getAttribute("AdminVO");
	//5.현재 페이지 기준 게시글 가져오기
	Map<String, String> map = new HashMap<>();
	map.put("begin", "1");
	map.put("end", "5");
	
	List<AdminVO> list = AdminDAO.getAllList(map);
	pageContext.setAttribute("list", list);
	
	List<memberVO> mList = AdminDAO.getAllmemberList(map);
	pageContext.setAttribute("mList", mList);
%>

<title>[A] 소셜 하비 앤 스터디</title>

<%
	if (session.getAttribute("AdminVO") == null) {
%>		<%@ include file="jieun/header.jsp"%>
<%	} else {
%>		<%@ include file="Admin/A_loginheader.jsp"%>
<%	}
%>

<style>
	/* 탭 스타일 */
	ul.tab {
		width: 800px; margin: auto;
		float: left;
		list-style: none;
	}
	ul.tab li {
		background-color: none;
		color: black;
		display: inline-block;
		cursor: pointer;
	}
	
	ul.tab li.current {
		text-decoration: underline;
		color: #b30000;
	}
	
	.tabcontent {
		display: none;
		width: 800px; margin: auto;
		
	}
	.tabcontent.current {
		display: inherit;
	}
	
	#allList .right { text-align: right; }


</style>



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
			<c:forEach var="vo" items="${list }">
				<tr>
					<td></td>
					<td>${vo.getBb_idx() }</td>
					<td>${vo.getBbs_name() }</td>
					<td>${vo.getTitle() }</td>
					<td>${vo.getId() }</td>
					<td>${vo.getRegdate().substring(0, 10) }</td>
				</tr>
			</c:forEach>
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