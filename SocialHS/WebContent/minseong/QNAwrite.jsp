<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 작성</title>
<script>
	function write_go(frm) {
		frm.action = "../QNA?type=QNAwrite";
		frm.submit();
	}
</script>
</head>
<body>

<div>
	<h2>게시물 작성</h2>
	<hr>
	<form method="post">
		<table>
		<tbody>
			<tr>	
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			
			<tr>
			<th>내용</th>
				<td>
					<textarea name="content" rows="5" cols="60"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="작성 완료" onclick="write_go(this.form)">
					<input type="reset" value="초기화">
					<input type="hidden" name="id" value="${memberVO.id }">
					<input type="hidden" name="chk" value="1">
				</td>
			</tr>
		</tfoot>	
		</table>
	</form>
</div>

</body>
</html>