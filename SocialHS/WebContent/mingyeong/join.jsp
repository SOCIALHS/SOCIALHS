<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String id = (String) session.getAttribute("id");
%>

<%@ include file="../jieun/header_head.jsp"%>
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

		if (!frm.name.value) {
			alert("이름을 입력하세요.");
			frm.name.focus();
			return false;
		}

		if (!frm.birthday.value) {
			alert("생년월일을 입력하세요.");
			frm.birthday.focus();
			return false;
		}
		if (!frm.birthmm.value) {
			alert("생년월일을 입력하세요.");
			return false;
		}
		if (!frm.birthdd.value) {
			alert("생년월일을 입력하세요.");
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
		if (!frm.addr.value) {
			alert("주소를 입력하세요.");
			frm.addr.focus();
			return false;
		}

		frm.action = "memberController?type=joinOk";
		frm.submit();
	}

	function idchk(frm) {

		var id1 = frm.id.value;

		if (id1 == "") {
			alert("아이디를 입력하세요.");
			frm.id.focus();
			return false;
		} else {
			window.open("mingyeong/usingIdchk.jsp?id=" + id1, "아이디 중복 확인",
					"width=450, height=200, left=300, top=200");
		}

		frm.submit();

	}

	function main(frm) {

		frm.action = "index.jsp";
		frm.submit();
<%session.removeAttribute("id");%>
	}
</script>
</head>
<%@ include file="../jieun/header.jsp"%>

<div id="join" style="width: 600px; padding: 20px;" class="mx-auto my-2 bg-light">
	<br>
	<h1 class="text-center">회원가입</h1>
	<br>
	
<form method="post">
	<table>
		<tbody>
			<tr class="form-inline">
				<td>
					<input type="text" class="form-control mb-2 mr-sm-2"
						id="id" name="id" maxlength="50" placeholder="아이디">
					<input type="button" class="btn btn-secondary mb-2"
						value="중복확인" onclick="idchk(this.form)">
				</td>
			</tr>
			<tr class="form-inline">
				<td>
					<input type="password" class="form-control mb-2 mr-sm-2"
						name="pw" maxlength="50" placeholder="비밀번호">
				</td>
				<td>
					<input type="password" class="form-control mb-2 mr-sm-2"
						name="pwchk" maxlength="50" placeholder="비밀번호 확인">
				</td>
			</tr>
			<tr class="form-group">
				<td>
					<input type="text" class="form-control"
						name="name" maxlength="50" placeholder="이름">
				</td>
			</tr>
			<tr class="form-group">
				<td>
					<input type="radio" name="gender" value="남" checked>남
					<input type="radio" name="gender" value="여">여
				</td>
			</tr>
			<tr class="form-inline">
				<td>
					<input type="text" name="birthday"
						class="form-control mb-2 mr-sm-2"
						maxlength="4" placeholder="년(4자)" size="6">
					
					<select name="birthmm" class="custom-select mr-sm-2 mb-2"
						id="inlineFormCustomSelect">
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
					<input type="text" name="birthdd"
						class="form-control mb-2 mr-sm-2"
						maxlength="2" placeholder="일" size="4">
				</td>
			</tr>
			<tr class="form-inline">
				<td>
					<input type="text"
						class="form-control mb-2 mr-sm-2" placeholder="이메일"
						name="email" maxlength="50">&nbsp;@&nbsp;
					<select name="com" class="custom-select mr-sm-2 mb-2">
						<option>naver.com</option>
						<option>daum.com</option>
						<option>nate.com</option>
						<option>gmail.com</option>
					</select>
				</td>
			</tr>
			<tr class="form-group">
				<td>
					<input type="text" class="form-control mb-2 mr-sm-2" placeholder="휴대전화번호"
						name="phone">
				</td>
			</tr>
			<tr class="form-group">
				<td>
					<input type="text" class="form-control mb-2 mr-sm-2" placeholder="주소"
						name="addr" size="50">
				</td>
			</tr>
		</tbody>
	</table>
	<br>
	<input type="button" class="btn btn-secondary mb-2"
		value="가입하기" onclick="joinOk(this.form)">
	<input type="reset" class="btn btn-secondary mb-2" value="취소">
	<input type="button" class="btn btn-secondary mb-2"
		value="메인화면" onclick="main(this.form)">
	<input type="hidden" name="joinchk" value="chk">
</form>
</div>


<%@ include file="../jieun/footer.jsp"%>