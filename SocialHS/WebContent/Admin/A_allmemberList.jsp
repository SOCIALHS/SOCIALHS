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
<%-- 게시글 목록 화면에 표시 --%>
<%
	//페이징 처리 
	Paging p = new Paging();
	AdminDAO adao = new AdminDAO();
	
	AdminVO avo = (AdminVO) session.getAttribute("AdminVO");
	
	p.setTotalRecord(adao.getMemberCount());
	p.setTotalPage(); //전체 페이지 수 구하기
	
	System.out.println("전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("전체 페이지 수 : " + p.getTotalPage());
	
	//2.현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	
	//3.현재 페이지의 시작번호와 끝 번호 
	p.setBegin((p.getNowPage() - 1) * p.getNumPerpage() +1);
	p.setEnd(p.getBegin() + p.getNumPerpage() -1);
	
	//4. 블록의 시작 페이지, 끝페이지 번호
	p.setBeginPage((p.getNowPage()-1) / p.getPagePerBlock() * p.getPagePerBlock() +1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock()-1);
	
	System.out.println("=============================");
	System.out.println("시작 페이지번호 : " + p.getBeginPage());
	System.out.println("끝 페이지번호 : " + p.getEndPage());
	System.out.println("=============================");
	
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}	
	
%>
<%	// ***** ***** ***** ***** ***** ***** ***** *****
	//5.현재 페이지 기준 게시글 가져오기
	Map<String, String> map = new HashMap<>();
	String beginNum = String.valueOf(p.getBegin());
	String endNum = String.valueOf(p.getEnd());
	map.put("begin", beginNum);
	map.put("end", endNum);
	
	List<memberVO> M_list = AdminDAO.getAllmemberList(map);
	pageContext.setAttribute("M_list", M_list);
	//System.out.println("M_list : " + A_list);
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
%>
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
<title>[A] 전체 회원 목록</title>
<style>
	#infohead {
		text-align: left;
		width: 250px;
		height: 100%;
		background-color: #f9f9f9;
		margin-top: -9999px;
		margin-bottom: -9999px;
		padding-top: 9999px;
		padding-bottom: 9999px;
	}
	#full { overflow: hidden; }
	.menu { text-indent: 10px; }
	.topMenuLi {
		list-style: none;
	}
	.topMenuLi li { list-style: none; }
	.menuLink {
		height: 35px;
		line-height: 35px;
	}
	
	.submenuUl { display: none; }
	.submenuUl a {
		margin-bottom: 2px;
		height: 35px;
		line-height: 35px;
		cursor: pointer;
	}
	
	.submenuLink {
		display: block;
		height: 100%; width: 100%;
		cursor: pointer;
		background-color: gold;
		text-decoration: none;
	}
	.submenuLink:hover {
		display: block;
		background-color: #f1f1f1;
	}
	
	
	
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: forestgreen;
	}
	#adminPage table {
		/* border: 1px lightgray solid;
		border-collapse: collapse; */
		width: 1000px; margin: auto; padding: 50px;
	}
	#adminPage .center { text-align: center; }
	#adminPage .right { text-align: right; }
	#adminPage .left { text-align: left; }

</style>

<link href="../css/A_Paging.css" rel="stylesheet" type="text/css">
<script>
	function memberInfo(frm) {
		frm.action = "";
		frm.submit();
	}


</script>
</head>
<body>
<div id="adminPage" class="container  text-black mx-auto mt-5 align-middle">
	<div id ="infohead" class="text-center">
		<input type="text" size="50px" id="search" placeholder="검색어 입력">&nbsp;&nbsp;
		<input type="button" onclick>검색
		<br>
		<ul class="tab nav mx-auto my-2" >
			<li class="nav-item"><a href="../AdminPage.jsp">처음으로</a></li>
			<span>&nbsp;&nbsp;</span>
			<li class="nav-item"><a href="javascript:history.back();">뒤로가기</a></li>
		</ul>
	
	</div>
	
	<form method="post">
		<table class="table my-2 mx-auto text-center">
			<thead class="thead bg-success text-white">
				<tr class="pagetitle">
					<th>NO</th>
					<th>아이디</th>
					<th>이름</th>
					<th>가입날짜</th>
					<th>등급</th>
					<th>포인트</th>
					<th>회원정보</th>
				</tr>
			</thead>
			<tbody>
			<%-- 데이터가 있을 때 --%>
			<c:if test="${not empty M_list}">
				<c:forEach var="allMember" items="${M_list }" varStatus="status">
					<tr>
					<%-- 전체 레코드 수 - ( (현재 페이지 번호 - 1) * 한 페이지당 보여지는 레코드 수 + 현재 게시물 출력 순서 ) --%>
						<td>${pvo.totalRecord - ((pvo.nowPage -1) * pvo.numPerpage + status.index) }</td>
						<td>${allMember.getId() }</td>
						<td>${allMember.getName() }</td>
						<td>${allMember.getRegdate().substring(0, 10) }</td>
						<td>${allMember.getRank() }</td>
						<td>${allMember.getPoint() }&nbsp;Point</td>
						<td><input type="button" value="상세보기" onclick="memberInfo(this.form)"></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty M_list }">
				<tr>
					<td colspan="7" class="center">가입된 회원이 없습니다.</td>
				</tr>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<c:choose>
							<%-- 사용불가 (첫번째 블록) --%>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
								<li class="disable">&lt;&nbsp;이전&nbsp;</li>
							</c:when>
							
							<%-- 사용가능 --%>
							<c:otherwise>
								<li><a href="MypageController?type=moreWrite&cPage=${pvo.beginPage-1 }">
								&lt;&nbsp;이전&nbsp;</a></li>
							</c:otherwise>
						</c:choose>
						
						<%-- 현재 블록의 시작페이지>끝 페이지 반복처리 --%>
						<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.nowPage }">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="MypageController?type=moreWrite&cPage=${k }">${k }</a>
								</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						<%-- 다음페이지 --%>
						<c:choose>
							<%-- 사용불가 --%>
							<c:when test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable" id="next">&nbsp;다음&nbsp;&gt;</li>
							</c:when>
							<c:otherwise>
								<li><a href="MypageController?type=moreWrite&cPage=${pvo.endPage+1 }">
									&nbsp;다음&nbsp;&gt;</a></li>
							</c:otherwise>
						</c:choose>
						</ol>
					
					</td>
				</tr>
			</tfoot>
		</table>
	
	</form>
</div>

</body>
</html>