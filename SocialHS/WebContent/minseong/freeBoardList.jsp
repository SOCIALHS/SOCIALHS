<%@page import="com.bc.member.Paging"%>
<%@page import="com.bc.minseong.command.FreeBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../head.jsp"%>
<% 
	System.out.println("-----------------------------");

	//페이징 처리를 위한 객체 생성
	Paging p = new Paging();
	//p.setNumPerPage(7);
	//p.setPagePerBlock(5);

	//1. 전체 게시물의 수를 구한다.
	p.setTotalRecord(FreeBoardDAO.getTotalCount());
	p.setTotalPage(); //전체 페이지 갯수 구하기

	System.out.println("전체 건수: " + p.getTotalRecord());
	System.out.println("전체 페이지 갯수: " + p.getTotalPage());

	//2. 현재 페이지 구하기(default : 1)
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}

	//3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
	//시작번호 먼저 구하기(복잡) -------------
	//p.setBegin((p.getNowPage() - 1) * p.getNumPerPage() + 1);
	//p.setEnd(p.getBegin() + p.getNumPerPage() - 1);

	//끝번호 먼저 구하기 ---------------
	//끝번호(end) = 현재페이지번호 * 페이지당표시글수
	p.setEnd(p.getNowPage() * p.getNumPerpage());
	p.setBegin(p.getEnd() - p.getNumPerpage() + 1);

	System.out.println("현재페이지(nowPage) : " + p.getNowPage());
	System.out.println("시작번호(begin) : " + p.getBegin());
	System.out.println("끝번호(end) : " + p.getEnd());

	//4. 블록의 시작페이지, 끝페이지 번호 구하기(현재페이지 번호 이용)
	int nowPage = p.getNowPage();
	p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

	//endPage 먼저 구하기
	//현재 페이지 / pagePerBlock 올림처리 * pagePerBlock 

	System.out.println("현재페이지(nowPage) : " + p.getNowPage());
	System.out.println("시작페이지(beginPage) : " + p.getBeginPage());
	System.out.println("끝페이지(endPage) : " + p.getEndPage());

	//4-1 끝페이지(endPage)가 총페이지(totalPage)보다 크면
	//endPage = totalPage 설정
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	System.out.println("변경후 끝페이지(endPage) : " + p.getEndPage());

	//현재페이지 기준 게시글 가져오기
%>


<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>		<%@ include file="../jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>		<%@ include file="../Admin/A_loginheader.jsp"%>
<%
	} 
%>
<%--
	//EL사용을 위해 scope에 데이타 등록(page 영역)
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<style>
#container {
	width: 512px;
	margin: auto;
}

#container h2 {
	text-align: center;
}

#container p {
	text-align: center;
}

#container table {
	width: 500px;
	padding: 0 5px;
	border: 1px solid black;
	border-collapse: collapse;
}

#container th, td {
	border: 1px solid black;
}

#container table th {
	background-color: #9cf;
}

#container table td {
	text-align: left;
}

#container p>a {
	text-decoration: none;
	font-weight: bold;
}

#container .center {
	text-align: center;
}

.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	font-weight: bold;
	color: black;
}

.paging li a:hover {
	background-color: #00B3DC;
	color: white;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background-color: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="container">
		<h1 class="display-4 my-5 text-center">자유게시판</h1>
		<hr>
		<p>
			<button type="button" class="btn btn-info"
				style="margin-left: 1100px;"
				onclick="location.href='minseong/freeBoardWrite.jsp'">게시물
				작성하기</button>
		</p>
		<table class="table mx-auto" style="width: 1000px;">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">GOOD</th>
					<th scope="col">BAD</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${not empty list }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td scope="row">${vo.getBb_idx() }</td>
							<td><a
								href="FreeController?type=freeOne&bb_idx=${vo.bb_idx }">${vo.getTitle() }</a></td>
							<td>${vo.getId() }</td>
							<td>${vo.getHit() }</td>
							<td>${vo.getGood() }</td>
							<td>${vo.getBad() }</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:if test="${empty list }">
					<tr scope="row">
						<td colspan="6">입력된 자료가 없습니다</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<div class="mx-auto" style="width: 1000px;">
		<nav aria-label="...">
			<ul class="pagination">
				<li class="page-item disabled"><span class="page-link">Previous</span>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active"><span class="page-link"> 2
						<span class="sr-only">(current)</span>
				</span></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>




<%@ include file="../jieun/footer.jsp"%>







