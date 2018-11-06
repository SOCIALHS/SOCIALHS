<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
</style>
<script>
	function editInfo(frm) {
		frm.action = "memberController?type=update";
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
<div id="mypage" class="jumbotron jumbotron-fluid">
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
						<input type="button" name="sendMsg" value="쪽지" >
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
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
			<%-- 리스트에 데이터가 있을 때 --%>
			<c:if test="${not empty mylist }">
				<c:forEach var="vo" items="${mylist }">
					<tr>
						<td class="center">${vo.getBb_idx() }</td>
						<td>${vo.getTitle() }</td>
						<td>${vo.getId() }</td>
						<td class="center">${vo.getRegdate() }</td>
						<td class="center">${vo.getRp() }</td>
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