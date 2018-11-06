<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<script>
	function update(frm) {
		
		var pw1 = frm.pw.value;
		var pw2 = frm.pwchk.value;
		
		if (pw1 != pw2) {
			alert("암호가 일치하지 않습니다.");
			frm.pw.value = "";
			frm.pw.focus();
			return false;
		}
		
		if (!frm.email.value) {
			alert("이메일을 입력하세요.");
			frm.email.focus();
			return false;
		}
		
		if (!frm.phone.value) {
			alert("전화번호를 입력하세요.");
			frm.phone.focus();
			return false;
		}
		
		if (!frm.address.value) {
			alert("주소를 입력하세요.");
			frm.address.focus();
			return false;
		}
		
		frm.action = "memberController?type=updateOk";
		frm.submit();
		
	}
</script>

</head>
<body>
<div>
	<p><font><b>내 정보 수정</b></font></p>
	<hr>
	<form method="post">
		<table>
		<tbody>
			<tr>
				<td id="title">이름</td>
				<td>${memberVO.getName() }</td>
			</tr>
			<tr>
				<td id="title">아이디</td>
				<td>${memberVO.getId() }</td>
			</tr>
			
			<tr>
				<td id="title">비밀번호</td>
				<td>
					<input type="password" name="pw" maxlength="50">
				</td>
			</tr>
			<tr>
				<td id="title">비밀번호 확인</td>
				<td>
					<input type="password" name="pwchk" maxlength="50">
				</td>
			</tr>
			
			<tr>
				<td id="title">이메일</td>
				<td>
					<input type="text" name="email" maxlength="50">@
					<select name="com">
						<option>naver.com</option>
						<option>daum.com</option>
						<option>nate.com</option>
						<option>gmail.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td id="title">휴대전화</td>
				<td>
					<input type="text" name="phone">
				</td>
			</tr>
			<tr>
				<td id="title">주소</td>
				<td>
					<input type="text" name="address" size="50">
				</td>
			</tr>
		</tbody>
		</table>
		<hr>
		<input type="button" value="수정" onclick="update(this.form)">
		<input type="reset" value="취소">
		<input type="hidden" name="id" value="${memberVO.getId() }">
		<input type="hidden" name="infochk" value="chk">
	</form>

</div>

</body>
</html>