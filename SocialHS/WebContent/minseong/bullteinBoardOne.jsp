<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<style>
#container {
	width: 512px;
	margin: auto;
}

#container h2 {
	text-align: center;
}

#container p {
	text-align: center;
}

#container table {
	width: 500px;
	padding: 0 5px;
	border: 1px solid black;
	border-collapse: collapse;
}

#container th, td {
	border: 1px solid black;
}

#container table th {
	background-color: #9cf;
}

#container table td {
	text-align: left;
}

#container p>a {
	text-decoration: none;
	font-weight: bold;
}

#container .center {
	text-align: center;
}
</style>
<script>
	function update_go(frm) {
		//frm.action = "BullteinController?type=bullteinUpdate&bb_idx=${BoardVO.getBb_idx() }";
		frm.action = "BullteinController?type=bullteinUpdate";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
</script>
</head>
<body>

	<div id="container bg-light m-5">
		<h1 class="display4">[${BoardVO.getBb_idx()}]&nbsp;${BoardVO.getTitle() }</h1>
		<hr>
		<div class="row">
			<p class="lead">작성자&nbsp;${BoardVO.getId() }</p>
		</div>
		<div class="row">
			<p class="lead">조회수&nbsp;${BoardVO.getHit() }</p>
		</div>
		<div class="row">
			<textarea name="content " row="5" cols="45">내용&nbsp;${BoardVO.getContent() }</textarea>
		</div>
		<div class="row">
			<p class="lead">좋아요&nbsp;${BoardVO.getGood() }</p>
		</div>
		<div class="row">
			<p class="lead">싫어요&nbsp;${BoardVO.getBad() }</p>
		</div>
		<div class="row">
			<input type="button" value="수정 " onclick="update_go(this.form)">
			<input type="button" value="삭제" onclick="delete_go(this.form)">
		</div>
	</div>

	<!-- Comments Form -->
	<div class="card my-4">
		<h5 class="card-header">Leave a Comment:</h5>
		<div class="card-body">
			<form method="post" action="cWriteCommand.jsp">
				<div class="form-group">
					<p>댓글번호: ${CommentVO.getBb_idx() }</p>
					<p>작성자 : ${CommentVO.getId() }</p>
					<textarea class="form-control" name="content" rows="3"></textarea>
					<p>작성일 : ${CommentVO.getRegdate() }</p>
				</div>
				<input type="submit" value="댓글 저장"> <input type="hidden"
					name="bb_idx" value="${bbvo.bb_idx }">
			</form>
		</div>
	</div>

	<hr>

	<%-- 댓글 출력 --%>
	<c:forEach var="CommentVO" items="${cList }">
		<div class="card my-4">
			<h5 class="card-header">Leave a Comment:</h5>
			<div class="card-body">
				<form action="cDelete.jsp" method="post">
					<div class="form-group">
						<p>댓글번호: ${CommentVO.bbc_idx }</p>
						<p>작성자 : ${CommentVO.id }</p>
						<textarea class="form-control" name="content" rows="3">
					 ${CommentVO.content }
					</textarea>
						<p>작성일 : ${CommentVO.regdate}</p>
					</div>
					<input type="sumbit" value="삭제"> <input type="hidden"
						name="bbc_idx" value="${CommentVO.bbc_idx }"> <input
						type="hidden" name="content" value="${CommentVO.content }">
					<input type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
				</form>
			</div>
		</div>
	</c:forEach>

</body>
</html>

