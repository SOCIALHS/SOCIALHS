<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
<style>
</style>
<script>
/* location.href='/MessengerController?type=delete&ms_idx=${list.ms_idx}' */
	function delOk(){
		var chk = confirm("쪽지를 삭제하시겠습니까?");
		if(chk == true){
			location.href='MessengerController?type=delete&ms_idx=${list.ms_idx}'
		}else {
			return false;
		}
	}
	
</script>
</head>
<body>
	<h1>여기는 쪽지 페이지 임돠</h1>

	<button onClick="location.href='memberController?type=myPage'">마이페이지로</button>
	<c:if test="${empty msnList}">
		<h2>쪽지 없다</h2>
	</c:if>
	<c:if test="${not empty msnList}">
		<table border="1">
			<thead>
				<tr>
					<th>보낸이</th>
					<th>제목</th>
					<th>발송일</th>
					<th>확인여부</th>
				</tr>
			</thead>
			<c:forEach var="list" items="${msnList }">
				<tr>
					<td>${list.send_id }</td>
					<td><a href="#"
						onClick="window.open('MessengerController?type=oneList&ms_idx=${list.ms_idx }&chk=${list.chk}','쪽지창', 'width=500px, height=300px')">${list.title }</a></td>
					<td>${list.regdate.substring(0,10) }</td>
					<c:if test="${list.chk == 1 }">
						<td>확인 안함</td>
					</c:if>
					<c:if test="${list.chk == 0 }">
						<td>확인함</td>
					</c:if>
					<td><button
							onClick="delOk()">삭제</button></td>
				</tr>
			</c:forEach>
		</table>
		<button onclick="location.href='/SocialHS/MessengerController?type=write'">쪽지 쓰기</button>
	</c:if>
</body>
</html>