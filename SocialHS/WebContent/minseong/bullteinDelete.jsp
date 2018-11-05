<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 게시글 삭제</title>
<script>
	function del_go(frm) {
		frm.action = "StudyController?type=bullteinDelete&bb_idx=${BullteinBoardVO.getBb-idx() }";
		frm.submit();
	}
</script>
</head>
<body>
<form>
	<input type="button" value="삭제" onclick="del_go(this.form)">
</form>
</body>
</html>