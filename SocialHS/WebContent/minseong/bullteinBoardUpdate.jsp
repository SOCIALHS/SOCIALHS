<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>
<script>
	function save_go(frm) {
		frm.action = "BullteinController?type=bullteinUpdate"; 
		frm.submit();
	}
</script>
</head>
<body>

<div>
	<h2>게시글 수정</h2>
	<hr>
	<form method="post">
		<table>
		<tbody>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" value="${BoardVO.getTitle() }">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" rows="5" cols="60">${BoardVO.getContent() }</textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정 완료"
						onclick="save_go(this.form)">
					<input type="reset" value="초기화">
				</td>
			</tr>
			<input type="hidden" name="bb_idx" value="${BoardVO.getBb_idx() }">
			<input type="hidden" name="chk" value="chk">
			
		</tfoot>	
		</table>
	</form>
</div>

</body>
</html>





