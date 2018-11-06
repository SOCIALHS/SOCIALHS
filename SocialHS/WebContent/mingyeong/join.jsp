<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
</style>

<script>
	function joinOk(frm) {
		
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
	
	function idchk(frm) {
		
		if (!frm.id.value) {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		}
		
		/* window.open("usingIdchk.html", "아이디 중복 확인",
				"width=400, height=300, left=100, top=50"); */
		
		frm.action = "memberController?type=idchk";
		frm.submit();
		
	}
	
	function main(frm) {
		
		frm.action = "index.jsp";
		frm.submit();
		<% session.removeAttribute("id"); %>
	}
	
</script>
</head>
<body>
<div id="join">
	<p><font size="6"><b>회원가입</b></font></p>

<form method="post">
	<table>
		<tbody>
			<tr>
				<td id="title">아이디</td>
				<% String id = (String)session.getAttribute("id"); %>
				<td>
					<input type="text" name="id" maxlength="50" value="${id }">
					<input type="button" value="중복확인" onclick="idchk(this.form)">
				</td>
			</tr>
		<!-- </tbody>
	</table>
</form>

<form method="get">
	<table>
		<tbody> -->
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
				<td id="title">이름</td>
				<td>
					<input type="text" name="name" maxlength="50">
				</td>
			</tr>
			<tr>
				<td id="title">성별</td>
				<td>
					<input type="radio" name="gender" value="남" checked>남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr>
				<td id="title">생일</td>
				<td>
					<input type="text" name="birthday" maxlength="4"
							placeholder="년(4자)" size="6">
					<select name="birthmm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<input type="text" name="birthdd" maxlength="2"
							placeholder="일" size="4">
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
					<input type="text" name="addr" size="50">
				</td>
			</tr>
		</tbody>
	</table>
	<br>
	<input type="button" value="가입하기" onclick="joinOk(this.form)">
	<input type="reset" value="취소">
	<input type="button" value="메인화면" onclick="main(this.form)">
	<input type="hidden" name="joinchk" value="chk">
</form>
</div>

</body>
</html>