<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 페이지</title>
<script>
	function update_go(frm) {
		frm.action = "StudyMainController?type=bullteinUpdate";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "StudyMainController?type=bullteinDelete";
		frm.submit();
	}
</script>
</head>
<body>
	<h2>상세화면</h2>
	<a href="../StudyController?type=bullteinList">목록으로</a>
	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${BullteinBoardVO.getId() }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${BullteinBoardVO.getId() }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${BullteinBoardVO.getHit() }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${BullteinBoardVO.getContent() }</td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td>${BullteinBoardVO.getPoint() }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정" onclick="update_go(this.form)"> 
				<input type="button" value="삭제" onclick="delete_go(this.form)"> 
			</td>
		</tr>
	</table>
	
</body>
</html>