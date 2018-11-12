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
	
	p.setTotalRecord(adao.getStudyCount());
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
	
	List<A_AllBoardVO> S_list = AdminDAO.getAllstudyList(map);
	pageContext.setAttribute("S_list", S_list);
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
<title>[A] 전체 게시판 글 목록</title>
<style>
	#infohead {
		width: 200px;
		height: 100%;
		background-color: #f9f9f9;
		margin-top: -9999px;
		margin-bottom: -9999px;
		padding-top: 9999px;
		padding-bottom: 9999px;
	}
	
	.menu { text-indent: 10px; }
	.topMenuLi {
		list-style: none;
		cursor: pointer;
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
		background-color: #f1f1f1;
		text-decoration: none;
	}
	.submenuLink:hover {
		display: block;
		background-color: gold;
	}
	
	#infohead a, #infohead a:hover { text-decoration: none; color: black; }
	a { color: black; }
	table a:hover {
		text-decoration: underline;
		color: forestgreen;
	}
	
	#adminPage table {
		/* border: 1px lightgray solid;
		border-collapse: collapse; */
		width: 1100px; margin: auto; padding: 50px; 
	}
	#allList, #hobbylist, #studylist, #allmemberInfo {
		padding-left: 50px; }
	#adminPage .center { text-align: center; }
	#adminPage .right { text-align: right; }
	#adminPage .left { text-align: left; }
	#adminPage { overflow: hidden; display: flex; }
	
	/* 탭 스타일 */
	.tabcontent { display: none; }
	.tabcontent.current { display: inherit; }
	#infohead .current { background-color: gold; } 
	/* 탭 스타일 끝 */
	
	#searchmenu {
		text-align: center; 
		padding-bottom: 20px;
	}


</style>
<link href="css/A_Paging.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	//내가 쓴 게시글 / 댓글 탭 
	$(document).ready(function() {
		$('.tab a').click(function() {
			var tabid = $(this).attr('data-tab');
			
			$('.tab a').removeClass('current');
			$('.tabcontent').removeClass('current');
			
			$(this).addClass('current');
			$("#"+tabid).addClass('current');
		})
	})
	
	//사이드바 
	$(document).ready(function() {
		$(".topMenuLi>a").click(function() {
			var submenu = $(this).next("div");
			if( submenu.is(":visible") ) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});
	});
</script>
</head>
<body>
<div id="adminPage" class="jumbotron jumbotron-fluid">
	
	<div id="infohead">
		<ul class="menu tab">
			<li class="topMenuLi">
				<a class="menuLink tablink current" data-tab="allList">전체 글목록</a>
				<div class="submenuUl nav-item">
					<a class="submenuLink tablink" data-tab="allList"
					href="AdminController?type=allList">전체보기</a>
					<a class="submenuLink tablink" data-tab="hobbylist" 
					href="AdminController?type=hobbylist">취미</a>
					<a class="submenuLink tablink" data-tab="studylist"
					href="AdminController?type=studylist">스터디</a>
				</div>
			</li>
			<li class="topMenuLi nav-item">
				<a class="menuLink tablink" data-tab="allmemberInfo"
				href="AdminController?type=allmemberInfo">회원정보보기</a></li>
		</ul>
	</div>
	
	<div id="studylist">
	
	<div id="searchmenu">
		<input type="text" size="50px" id="search" placeholder="검색어 입력">&nbsp;&nbsp;
		<input type="button" value="검색" onclick="search_allwrite(this.form)">
	</div>
	
	
	<form method="post">
		<table class="table my-2 mx-auto text-center">
			<thead class="thead bg-success text-white">
				<tr class="pagetitle">
					<th>NO</th>
					<th class="no">게시판번호</th>
					<th class="category">카테고리</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<th>모집여부</th>
					<th>모집인원</th>
				</tr>
			</thead>
			<tbody>
			<%-- 데이터가 있을 때 --%>
			<c:if test="${not empty S_list}">
			<c:forEach var="study" items="${S_list }" varStatus="status">
				<tr>
					<td>${pvo.totalRecord - ((pvo.nowPage -1) * pvo.numPerpage + status.index) }</td>
					<td>${study.getBb_idx() }</td>
					<td>${study.getBbs_name() }</td>
					<td><a href="#">${study.getTitle() }</a></td>
					<td>${study.getId() }</td>
					<td>${study.getRegdate().substring(0, 10) }</td>
					<td>${study.getRp() }</td>
					<td>${study.getCur_member() }&nbsp;/&nbsp;${study.getReq_member() }</td>
				</tr>
			</c:forEach>	
			</c:if>
			
			<c:if test="${empty S_list}">
				<tr>
					<td colspan="8" class="center">등록된 게시글이 없습니다.<br>
						지금 바로 새로운 게시글을 등록해 보세요!</td>
				</tr>
			</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<c:choose>
							<%-- 사용불가 (첫번째 블록) --%>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
								<li class="disable">&lt;&nbsp;이전&nbsp;</li>
							</c:when>
							
							<%-- 사용가능 --%>
							<c:otherwise>
								<li><a href="AdminController?type=studylist&cPage=${pvo.beginPage-1 }">
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
									<a href="AdminController?type=studylist&cPage=${k }">${k }</a>
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
								<li><a href="AdminController?type=studylist&cPage=${pvo.endPage+1 }">
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
</div>

</body>
</html>