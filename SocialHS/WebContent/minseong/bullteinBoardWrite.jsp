<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 작성페이지</title>
<script>
	function write_go(frm) {
		frm.action = "BullteinController?type=write";
				frm.submit();
	}
</script>
</head>
<body>
<h2>공지 작성페이지</h2>
	<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>	
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>	
				<th>내용</th>
				<td><input type="text" name="content"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="작성완료" onclick="write_go(this.form)">
					<input type="reset" value="다시작성">
					<input type="hidden" name="write_chk" value="chk">
				</td>
				
	</table>
</body>
</html>