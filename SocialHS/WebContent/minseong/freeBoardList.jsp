<%@page import="com.bc.member.Paging"%>
<%@page import="com.bc.minseong.command.FreeBoardDAO"%>
<%@page import="com.bc.study.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	//EL사용을 위해 scope에 데이타 등록(page 영역)
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
%>
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
		<h2>자유게시판</h2>
		<hr>
		<p>
			[<a href="minseong/freeBoardWrite.jsp">게시물 작성</a>]
		</p>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>GOOD</th>
					<th>BAD</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${not empty list }">
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.getBb_idx() }</td>
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
					<tr>
						<td colspan="7">입력된 자료가 없습니다</td>
					</tr>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<ol class="paging">
							<%--[이전으로]에 대한 사용여부 처리 --%>
							<c:choose>
								<%-- 사용불가(disable) : 첫번째 블록인 경우 --%>
								<c:when test="${pvo.beginPage == 1 }">
									<li class="disable">이전으로</li>
								</c:when>
								<%--사용가능(enable) : 두번째 이상(첫번째 아닌경우) --%>
								<c:otherwise>
									<li><a href="list.jsp?cPage=${pvo.beginPage - 1 }">이전으로</a>
									</li>
								</c:otherwise>
							</c:choose>

							<%-- 블록내에 표시할 페이지 반복처리(시작페이지~끝페이지)--%>
							<c:forEach var="k" begin="${pvo.beginPage }"
								end="${pvo.endPage }">
								<c:choose>
									<c:when test="${k == pvo.nowPage }">
										<li class="now">${k }</li>
									</c:when>
									<c:otherwise>
										<li><a href="list.jsp?cPage=${k }">${k }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<%--[다음으로]에 대한 사용여부 처리 --%>
							<c:choose>
								<%--사용불가(disable) : endPage가 전체페이지수 보다 크거나 같으면 --%>
								<c:when test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">다음으로</li>
								</c:when>
								<%--사용가능(enable) --%>
								<c:otherwise>
									<li><a href="list.jsp?cPage=${pvo.endPage + 1 }">다음으로</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

</body>
</html>










