<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
</head>
<body>

	<table border="1">
		<thead>
			<tr>
				<th>보낸이</th>
				<td>${msnVO.send_id }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${msnVO.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="40">${msnVO.content }</textarea></td>
			</tr>
			<tr>
				<th>발송일</th>
				<td>${msnVO.regdate }</td>
			</tr>
		</thead>
	</table>


</body>
</html>