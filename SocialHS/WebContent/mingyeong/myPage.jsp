<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
	#mypage table {
		border: 1px lightgray solid;
		border-collapse: collapse;
		width: 500px; padding: 0 5px;
		
	}
	th, td {
		border: 1px lightgray solid;
		border-collapse: collapse;
	}
	#mypage .center { text-align: center; }
	#mypage .right { text-align: right; }
	
</style>
<script>
	function edit(frm) {
		frm.action = "memberController?type=update";
		frm.submit();
	}
	function sendMsg(frm) {
		
	}
</script>
</head>
<body>
<div id="mypage">
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
						<input type="button" name="edit" value="내 정보 수정" onclick="edit(this.form)">
						<input type="button" name="sendMsg" value="쪽지" onclick="">
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
			<input type="hidden" name="id" value="${vo.getId() }">
			<input type="hidden" name="infochk" value="chk">
			</tbody>
		</table>
	</form>
</div>

</body>
</html>