<%@page import="com.bc.minseong.command.QNA_DAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.member.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Paging p = new Paging();

	p.setTotalRecord(BullteinBoardDAO.getTotalCount());
	p.setTotalPage();
	
	
	String cPage = request.getParameter("cPage");
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
	map.put("beginPage", p.getBegin());
	map.put("endPage", p.getEnd());
	System.out.println("map : "+ map);
	
	List<BoardVO> list = QNA_DAO.getMaplist(map);

	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
%>	
	
<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	}
%>

<title>Q&A 게시판</title>

</head>

<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../Admin/A_loginheader.jsp"%>
<%
	}
%>

<!--  <BODY>  -->

<div id="container">
	<h1 class="display-4 my-5 text-center">Q&A</h1>
	<hr>
	<a href="/SocialHS/minseong/QNAwrite.jsp"><p class="lead text-center">게시물 작성하기</p></a>
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
						<td><a href="QNA?type=QNAone&bb_idx=${vo.bb_idx }">${vo.getTitle() }</a></td>
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
		<!-- 페이징  -->
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
							<li><a href="/SocialHS/minseong/QNAlist.jsp?cPage=${pvo.beginPage - 1 }"> ← </a></li>
						</c:otherwise>
					</c:choose>
					
					
					<%-- 블록내 페이지 반복 --%>
					
					<c:forEach var="p" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:choose>
					<c:when test="${p == pvo.nowPage }">
						<li class="now">${p }</li>
					</c:when>
					<c:otherwise>
						<li><a href="/SocialHS/minseong/QNAlist.jsp?cPage=${p }">${p }</a></li>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<%-- 다음으로(→) --%>
					
					<c:choose>
						<c:when test="${pvo.endPage >= pvo.totalPage }">
							<li class="disable"> → </li>
						</c:when>
						<c:otherwise>	
							<li><a href="/SocialHS/minseong/QNAlist.jsp?cPage=${pvo.endPage + 1 }"> → </a></li>
						</c:otherwise>
					</c:choose>
					
					
					</ol>
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<%@ include file="../jieun/footer.jsp"%>










