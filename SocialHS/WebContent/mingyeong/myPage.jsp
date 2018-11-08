<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.member.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 게시글 목록 화면에 표시 --%>

<%
	memberVO mvo = (memberVO)session.getAttribute("memberVO");
	//5.현재 페이지 기준 게시글 가져오기 
	Map<String, String> map = new HashMap<>();
	map.put("begin", "1");
	map.put("end", "5");
	map.put("id", mvo.getId());

	List<BoardVO> list = memberDAO.getMypageList(map);
	session.setAttribute("list", list);
	
%>

	<jsp:include page="../head.jsp"></jsp:include>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">

<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	#infohead {
		text-align: left;
		width: 800px; margin: auto;
	}
	#infohead a { color: black; }
	#infohead a:hover {
		text-decoration: underline;
		color: orangered;
	}
	#mypage table {
		/* border: 1px lightgray solid;
		border-collapse: collapse; */
		width: 800px; margin: auto; padding: 50px;
		
	}
	/* th, td {
		border: 1px lightgray solid;
		border-collapse: collapse;
	} */
	#mypage .center { text-align: center; }
	#mypage .right { text-align: right; }

	/* 탭 스타일 */
	.tablink {
		
		float: left;
		border: none;
		outline: none;
		cursor: pointer;
		width: 20%; margin: auto;
		background-color: black;
		color: white;
	}
	.tablink:hover {
		text-decoration: underline;
	}
	
	.tabcontent {
		color: black;
		width: 800px; margin: auto;
		border: 1px solid silver;
		border-collapse: collapse;
		
	}
	#btn {
		width: 800px; margin: auto;
	}
	
	
	
	
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

	<jsp:include page="../jieun/loginheader.jsp"></jsp:include>

<!-- jumbotron -->
<div id="mypage"
	class="container  text-black mx-auto mt-5 align-middle">
	<div class="container text-center">
		<ul id ="infohead" class="nav mx-auto my-2">
			<li class="nav-item">내 정보&nbsp;|&nbsp;</li>
			<li class="nav-item"><a href="">Q&A</a>&nbsp;|&nbsp;</li>
			<li class="nav-item"><a href="index.jsp">home</a></li>
		</ul>
	
	<form method="post">
		<table class="table my-2 mx-auto">
			<thead class="thead-dark">
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
					<td class="center">${memberVO.getRegdate().substring(0, 10) }</td>
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
		
		<%-- 최신 글 목록/댓글 목록 보이기(제일 위에 글/댓글 5개만) --%>
		<%-- 내가 쓴 게시글 / 내가 쓴 댓글 /  카페 활동 알림 --%>
		<div id="btn">
			<button class="tablink" onclick="openPage('allPage', this, 'white')">내가 쓴 게시글</button>
			<button class="tablink" onclick="openPage('allComment', this, 'white')">내가 쓴 댓글</button>
		</div>
		<br>
	
		<div id="allPage">
			<table class="table my-2 mx-auto">
				<thead >
					<tr>
						<th class="no">글번호</th>
						<th class="title">제목</th>
						<th class="writer">글쓴이</th>
						<th class="date">작성일</th>
						<th class="hit">조회</th>
					</tr>
				</thead>
				<tbody>
					<%-- 리스트에 데이터가 있을 때 --%>
					<c:if test="${not empty list }">
						<c:forEach var="vo" items="${list }">
							<tr>
								<td class="center">${vo.getBb_idx() }</td>
								<td class="clickTitle"><a href="">${vo.getTitle() }</a></td>
								<td>${vo.getId() }</td>
								<td class="center">${vo.getRegdate().substring(0, 10) }</td>
								<td class="center">${vo.getHit() }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<tr>
							<td colspan="5" class="center">등록된 게시글이 없습니다.<br>
								지금 바로 새로운 게시글을 등록해 보세요!</td>
						</tr>
					</c:if>
			</tbody>
			</table>
		</div>
		
		
		<%-- 댓글 --%>
		<div id="allComment">
			<table class="table my-2 mx-auto">
				<tr>
					<th colspan="5">등록된 댓글이 없습니다.</th>
					
				</tr>
			
			</table>
		
		</div>
		
	</form>
	</div>
</div>
<script>
	function openPage(pageName,elmnt,color) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i=0; i<tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		
		tablinks = document.getElementsByClassName("tablink");
		for (i=0; i<tablinks.length; i++) {
			tablinks[i].style.backgroundColor ="";
		}
		
		document.getElementById(pageName).style.display = "block";
		elmnt.style.backgroundColor = color;
	}
	document.getElementById("defaultOpen").click();



</script>

</body>

</html>