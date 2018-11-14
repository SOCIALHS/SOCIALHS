<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.member.Paging"%>
<%@page import="com.bc.minseong.command.FreeBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../head.jsp"%>

<%
	Paging p = new Paging();

	p.setTotalRecord(FreeBoardDAO.getTotalCount());
	p.setTotalPage();
	
	System.out.println("FreeBoardDAO.getTotalCount() : " + FreeBoardDAO.getTotalCount());
	System.out.println("전체 페이지 수 : " + p.getTotalPage());
	
	String cPage = request.getParameter("cPage");
	System.out.println("cPage: "+ cPage);
	if(cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	p.setEnd(p.getNowPage() * p.getNumPerpage());
	p.setBegin(p.getEnd() - p.getNumPerpage() + 1);
	
	
	p.setBeginPage((p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
	
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
%>
<%
	Map<String, Integer> map = new HashMap<>();

	System.out.println("begin : "+ p.getBegin());
	System.out.println("end : "+ p.getEnd());
	
	map.put("beginPage", p.getBegin());
	map.put("endPage", p.getEnd());
	System.out.println("map : "+ map);
	
	List<BoardVO> list = FreeBoardDAO.getMaplist(map);
	System.out.println("list : " + list);

	pageContext.setAttribute("list", list);
	System.out.println("list2 : " + list);
	
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
%>


<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>		<%@ include file="../jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>		<%@ include file="../head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>		<%@ include file="../head.jsp"%>
<%
	} 
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
		float:left;
		margin-right: 8px;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid black;
		font-weight: bold;
		color: black;
	}
	.paging li a:hover {
		background-color: grey;
		color: black;
	}
	.paging .disable {
		padding: 3px 7px;
		border: 1px solid silver;
		color: silver;
	}
	.paging .now {
		padding: 3px 7px;
		border: 1px solid #9cf;
		background-color: #9cf;
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
			<!-- 페이징 
		<tfoot>
			<tr>
				<td colspan="6">
					<ol class="paging">
					
					<%-- 이전으로(←) --%>
					<c:choose>
						<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
							<li class="disable"> ← </li>
						</c:when>
						<c:otherwise>
							<li><a href="/SocialHS/minseong/freeBoardList.jsp?cPage=${pvo.beginPage - 1 }"> ← </a></li>
						</c:otherwise>
					</c:choose>
					
					
					<%-- 블록내 페이지 반복 --%>
					
					<c:forEach var="p" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:choose>
					<c:when test="${p == pvo.nowPage }">
						<li class="now">${p }</li>
					</c:when>
					<c:otherwise>
						<li><a href="/SocialHS/minseong/freeBoardList.jsp?cPage=${p }">${p }</a></li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<%-- 다음으로(→) --%>
					
					<c:choose>
						<c:when test="${pvo.endPage >= pvo.totalPage }">
							<li class="disable"> → </li>
						</c:when>
						<c:otherwise>	
							<li><a href="/SocialHS/minseong/freeBoardList.jsp?cPage=${pvo.endPage + 1 }"> → </a></li>
						</c:otherwise>
					</c:choose>
					
					
					</ol>
				</td>
			</tr>
		</tfoot> -->
		</table>
	</div>
				
	<nav aria-label="..." style="margin-left: 640px; margin-top: 50px;">
		<ul class="pagination">
		
		
		<%-- 이전으로(←) --%>
			<c:choose>
				<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
					<li class="page-item disabled"><span class="page-link">이전</span></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/SocialHS/minseong/freeBoardList.jsp?cPage=${pvo.beginPage - 1 }">이전</a></li>
				</c:otherwise>
			</c:choose>		

			
			
			
					<%-- 블록내 페이지 반복 --%>
					
			<c:forEach var="p" begin="${pvo.beginPage }" end="${pvo.endPage }">				<c:choose>
			<c:when test="${p == pvo.nowPage }">
				<li class="page-item active"><span class="page-link">${p }<span
						class="sr-only">(current)</span>
				</span></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="/SocialHS/minseong/freeBoardList.jsp?cPage=${p }">${p }</a></li>
			</c:otherwise>
			</c:choose>
			</c:forEach>			
			
			
			
			
					<%-- 이전으로(←) --%>
			<c:choose>
				<c:when test="${pvo.endPage >= pvo.totalPage }">
					<li class="page-item disabled"><span class="page-link">다음</span></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="/SocialHS/minseong/freeBoardList.jsp?cPage=${pvo.beginPage + 1 }">다음</a></li>
				</c:otherwise>
			</c:choose>		
			
			
			
			
		</ul>
	</nav>

<%@ include file="../jieun/footer.jsp"%>







