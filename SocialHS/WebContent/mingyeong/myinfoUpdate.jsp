<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../jieun/header_head.jsp" %>
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
		
		alert("정보가 수정되었습니다!");
		frm.action = "MypageController?type=updateOk";
		frm.submit();
		
	}
</script>

</head>
<<<<<<< HEAD
	<jsp:include page="../jieun/loginheader.jsp"></jsp:include>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<body>
=======
<%@ include file="../jieun/header.jsp" %>
>>>>>>> refs/remotes/origin/master
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
		<input type="button" value="뒤로가기" onclick="history.back(-1); return false;">
		<input type="hidden" name="id" value="${memberVO.getId() }">
		<input type="hidden" name="infochk" value="chk">
	</form>

</div>
<<<<<<< HEAD
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
=======

<%@ include file="../jieun/footer.jsp" %>
>>>>>>> refs/remotes/origin/master
