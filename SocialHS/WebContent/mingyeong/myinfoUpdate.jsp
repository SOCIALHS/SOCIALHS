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
	<jsp:include page="../jieun/loginheader.jsp"></jsp:include>

	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<body>
<div id="mypageupdate"
		style="width: 600px;" class="mx-auto mt-5 align-middle"" >
	<p><font size="6"><b>내 정보 수정</b></font></p>
	<hr>
	<form method="post">
		<table>
		<tbody>
			<tr class="form-inline">
				<td id="title"><font size="4"><b>이름</b></font></td>
				<td><font size="4">${memberVO.getName() }</font></td>
			</tr>
			<tr class="form-inline">
				<td id="title"><font size="4"><b>아이디</b></font></td>
				<td><font size="4">${memberVO.getId() }</font></td>
			</tr>
			
			<tr class="form-inline">
				<td>
					<input type="password" name="pw" maxlength="50"
						class="form-control mb-2 mr-sm-2" placeholder="비밀번호">
				</td>
				<td>
					<input type="password" name="pwchk" maxlength="50"
						class="form-control mb-2 mr-sm-2" placeholder="비밀번호 확인">
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
		<hr>
		<input type="button" class="btn btn-secondary mb-2" value="수정" onclick="update(this.form)">
		<input type="reset" class="btn btn-secondary mb-2" value="취소">
		<input type="button" class="btn btn-secondary mb-2" value="뒤로가기"
				onclick="history.back(-1); return false;">
				
		<input type="hidden" name="id" value="${memberVO.getId() }">
		<input type="hidden" name="infochk" value="chk">
	</form>

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

<%@ include file="../jieun/footer.jsp" %>
