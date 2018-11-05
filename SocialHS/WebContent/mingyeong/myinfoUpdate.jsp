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
		frm.action = "memberController?type=joinOk";
		frm.submit();
		
	}
</script>

</head>
<body>
<div>
	<p><font><b>내 정보 수정</b></font></p>
	<hr>
	<form method="get">
		<table>
		<tbody>
			<tr>
				<td id="titld">이름</td>
				<td>${vo.getName() }</td>
			</tr>
			<tr>
				<td id="titld">아이디</td>
				<td>${vo.getId() }</td>
			</tr>
			
			<tr>
				<td id="titld">비밀번호</td>
				<td>
					<input type="password" name="pw" maxlength="50">
				</td>
			</tr>
			<tr>
				<td id="titld">비밀번호 확인</td>
				<td>
					<input type="password" name="pwchk" maxlength="50">
				</td>
			</tr>
			
			<tr>
				<td id="titld">이메일</td>
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
				<td id="titld">휴대전화</td>
				<td>
					<input type="text" name="phone">
				</td>
			</tr>
			<tr>
				<td id="titld">주소</td>
				<td>
					<input type="text" name="address" size="50">
				</td>
			</tr>
		</tbody>
			<input type="hidden" name="id" value="${vo.getId() }">
			<input type="hidden" name="infochk" value="chk">
		</table>
		<hr>
		<input type="button" value="수정" onclick="update(this.form)">
		<input type="reset" value="취소">
	</form>

</div>

</body>
</html>