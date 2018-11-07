<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
</head>
<body>

	<h1>여기는 쪽지 확인 페이지임돠</h1>
	<table>
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
				<td>${msnVO.content }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${msnVO.regdate }</td>
			</tr>
		</thead>
	</table>


	${msnVO }

</body>
</html>