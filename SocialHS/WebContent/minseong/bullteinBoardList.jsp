<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
<%@page import="com.bc.study.dao.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	Paging p = new Paging();
	p.setTotalRecord(BullteinBoardDAO.getTotalCount());
	p.setTotalPage();
	
	String cPage = request.getParameter("cPage");
	if(cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	
	p.setEndContent(p.getNowPage() * p.getNumPerPage());
	p.setBeginContent(p.getEndContent() - p.getNumPerPage() + 1);
	
	int nowPage = p.getNowPage();
	p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
	
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	
	
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<style>
	
</style>
<body>
<h2>공지 게시판</h2>
	<a href="../StudyController?type=bullteinWrite">공지 작성</a>
	<table border="1">
		<thead>
			<tr>
				<th>no</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${not empty list }">
			<c:forEach var="st" items="${list }">
			<tr>
				<td>${st.getBb_idx() }</td>
				<td><a href="StudyController?type=bullteinWrite&$b_idx=${st.bb_idx }">${st.getTitle() }</a></td>
				<td>${st.getId() }</td>
				<td>${st.getRegdate }</td>
				<td>${st.getHit() }</td>
				<td>${st.Good() }</td>
				<td>${st.bad() }</td>
			</tr>
		</c:forEach>
		</c:if>
		
		</tbody>
		<tfoot>
		<ol>
			<tr>
				<td colspan="6">
					<c:choose>
						<c:when test="${bbvo.beginPage == 1 }">
							<li> ← </li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="bullteinList.jsp?cPage=${bbvo.beginPage - 1 }"> ← </a>
							</li>
						</c:otherwise>
					</c:choose>
				<c:forEach var = "k" begin="${bbvo.beginPage }" end="${bbvo.endPage }">
					<c:choose>
						<c:when test="${k == bbvo.nowPage }">
							<li>%{k}</li>
						</c:when>
						<c:otherwise>
							<li>
								 <a href="BullteinBoardList.jsp?cPage=${k }">${k }</a>
							</li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:choose>
					<c:when test="${bbvo.endPage >= bbvo.totalPage }">
						<li>
							<li> → </li>
						</li>
					</c:when>
					<c:otherwise>
							<a href="BullteinBoardList.jsp?cPage=${bbvo.endPage + 1 }"> → </a>
					</c:otherwise>
				</c:choose>
				</ol>
				</td>
				
			</tr>
		</tfoot>
	</table>
</body>
</html>