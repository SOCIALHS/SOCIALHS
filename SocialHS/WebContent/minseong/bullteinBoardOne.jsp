<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<style>
	#container {
		width: 512px; margin: auto;
	}
	#container h2 { text-align: center; }
	#container p { text-align: center; }
	#container table {
		width: 500px; padding: 0 5px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	#container th, td { border: 1px solid black; }
	#container table th {
		background-color: #9cf;
	}
	#container table td {
		text-align: left;
	}
	#container p > a {
		text-decoration: none;
		font-weight: bold;
	}
	#container .center { text-align: center; }
	
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

<div id="container">
	<h2>공지 사항</h2>
	<hr>
	<form method="post">
		<table>
		<tbody>
		<tr>
			<th>글번호</th>
			<td>${BoardVO.getBb_idx() }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${BoardVO.getId() }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${BoardVO.getHit() }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content " row="5" cols="45">${BoardVO.getContent() }</textarea></td>
		</tr>
		<tr>
			<th>good</th>
			<td>${BoardVO.getGood() }</td>
		</tr>
		<tr>
			<th>bad</th>
			<td>${BoardVO.getBad() }</td>
		</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정 "
						onclick="update_go(this.form)">
					<input type="button" value="삭제"
						onclick="delete_go(this.form)">
				</td>
			</tr>
		</tfoot>	
		</table>
	</form>
</div>
<div>
<hr>
	<%-- 댓글 입력 --%>
	<form method="post" action="cWriteCommand.jsp">
		<p>댓글번호: ${CommentVO.getBb_idx() }</p>
		<p>작성자 : ${CommentVO.getId() }</p>
		<p>내용 : <textarea name="content " row="4" cols="55"></textarea></p>
		<p>작성일 : ${CommentVO.getRegdate() }</p>
		<input type="submit" value="댓글 저장">
	
		<input type="hidden" name="bb_idx" value="${bbvo.bb_idx }">
		<%-- <input type="hidden" name="cPage" value="${cPage }" --%>
	</form>
	
	<hr>
	
	댓글 목록
	
	<hr>
	
<%-- 댓글 출력 --%>
<c:forEach var="CommentVO" items="${cList }">
<div class="comment">
	<form action="cDelete.jsp" method="post">
		<p>댓글번호 : ${CommentVO.bbc_idx }</p>
		<p>작성자 : ${CommentVO.id }</p>
		<p>내용 : ${CommentVO.content }</p>
		<p>작성일 : ${CommentVO.regdate}</p>
		<input type="sumbit" value="삭제">
		
		<input type="hidden" name="bbc_idx" value="${CommentVO.bbc_idx }">
		<input type="hidden" name="content" value="${CommentVO.content }">
		<input type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
	</form>
</div>
</c:forEach>
	
</body>
</html>

