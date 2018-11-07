<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bc.main.dao.MainDAO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.member.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 게시글 목록 화면에 표시 --%>
<%
	//페이징 처리 
	Paging p = new Paging();
	BoardVO bvo = new BoardVO();
	MainDAO dao = new MainDAO();
		
	//1.전체 게시물 수
	p.setTotalRecord(dao.getTotalCount());
	p.setTotalPage(); 
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
<%
	//5.현재 페이지 기준 게시글 가져오기 
	Map<String, Integer> map = new HashMap<>();
	map.put("begin", p.getBegin());
	map.put("end", p.getEnd());
	
	List<BoardVO> list = MainDAO.getMypageList(map);
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);

%>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">

<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	.infohead {
		text-align: left;
		width: 512px; margin: auto;
	}
	/* #mypage {
		text-align: center;
		width: 512px; margin: auto; padding: 50px;
	} */
	#mypage table {
		border: 1px lightgray solid;
		border-collapse: collapse;
		width: 512px; margin: auto; padding: 50px;
		
	}
	th, td {
		border: 1px lightgray solid;
		border-collapse: collapse;
	}
	#mypage .center { text-align: center; }
	#mypage .right { text-align: right; }
	
	/* 페이징 표시 시작 */
	.paging { list-style: none; }
	
	
	
	
	
	/* 페이징 표시 끝 */
</style>
<script>
	function editInfo(frm) {
		frm.action = "memberController?type=update";
		frm.submit();
		
	}
	function messengerGo(frm) {
		frm.action = "MessengerController?type=msnList";
		frm.submit();
		
	}
	function deleteInfo(frm) {
		if (confirm("회원 탈퇴를 하시겠습니까?") == true) {
			
			frm.action = "memberController?type=delete";
			frm.submit();
		} else {
			return;
		}
		
	}
	
</script>
</head>

<body>

<!-- jumbotron -->
<div id="mypage" >
	<div class="container text-center">
	<p class ="infohead">내 정보&nbsp;|&nbsp;
	<a href="">Q&A</a>&nbsp;|&nbsp;
	
	<a href="index.jsp">home</a></p>
	
	<form method="post">
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>등급</th>
					<th>포인트</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="center">${memberVO.getId() }</td>
					<td class="center">${memberVO.getName() }</td>
					<td class="center">${memberVO.getRank() } 등급</td>
					<td class="center">${memberVO.getPoint() } point</td>
					<td class="center">${memberVO.getRegdate() }</td>
				</tr>
				<tr>
					<td colspan="5" class="right">
						<input type="button" name="edit" value="내 정보 수정"
							onclick="editInfo(this.form)">
						<input type="button" name="sendMsg" value="쪽지"
							onclick="messengerGo(this.form)">
						<input type="button" name="delete" value="탈퇴하기"
							onclick="deleteInfo(this.form)">
						
						<input type="hidden" name="id" value="${memberVO.getId() }">
						<input type="hidden" name="infochk" value="chk">
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		
		<table>
			<thead>
				<tr class="pagetitle">
					<th class="no">글번호</th>
					<th class="title">제목</th>
					<th class="writer">글쓴이</th>
					<th class="date">작성일</th>
					<th class="hit">조회</th>
				</tr>
			</thead>
			<tbody>
			<%-- 리스트에 데이터가 있을 때 --%>
			<c:if test="${not empty mylist }">
				<c:forEach var="vo" items="${mylist }">
					<tr>
						<td class="center">${bvo.getBb_idx() }</td>
						<td>${bvo.getTitle() }</td>
						<td>${bvo.getId() }</td>
						<td class="center">${bvo.getRegdate() }</td>
						<td class="center">${bvo.getRp() }</td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty mylist }">
				<tr>
					<td colspan="5" class="center">등록된 게시글이 없습니다.<br>
						지금 바로 새로운 게시글을 등록해 보세요!</td>
				</tr>
			</c:if>
			
			</tbody>
			<tfood>
				<tr>
					<td colspan="5">
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<c:choose>
							<%-- 사용불가 (첫번째 블록) --%>
							<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
								<li class="disable">◀&nbsp;이전&nbsp;</li>
							</c:when>
							
							<%-- 사용가능 --%>
							<c:otherwise>
								<li><a href="myPage.jsp?cPage=${pvo.beginPage-1 }">
								◀&nbsp;이전&nbsp;</a></li>
							</c:otherwise>
						</c:choose>
						
						<%-- 현재 블록의 시작페이지>끝 페이지 반복처리 --%>
						<c:forEach var="k" begin="{pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.nowPage }">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="myPage.jsp?cPage=${k }">${k }</a>
								</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						<%-- 다음페이지 --%>
						<c:choose>
							<%-- 사용불가 --%>
							<c:when test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable">&nbsp;다음&nbsp;▶</li>
							</c:when>
							<c:otherwise>
								<li><a href="myPage.jsp?cPage=${pvo.endPage+1 }">&nbsp;다음&nbsp;▶</a></li>
							</c:otherwise>
						</c:choose>
						</ol>
					
					</td>
				</tr>
			</tfood>
		</table>
	</form>
	</div>
</div>

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>

</html>