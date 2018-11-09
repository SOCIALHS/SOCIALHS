<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Required meta tags -->
<meta charset="utf-8">
<%@ include file="../head.jsp"%>
<title>${BoardVO.title }</title>

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
	<div class="container bg-light">
		<div class="p-5">
			<h1 class="display4">${BoardVO.getTitle() }</h1>
			<hr>
			<div class="row">
				<p class="lead">작성자&nbsp;&nbsp;${BoardVO.getId() }</p>
			</div>
			<div class="row">
				<p class="lead">조회수&nbsp;&nbsp;${BoardVO.getHit() }</p>
			</div>
			<div class="row">
				<textarea class="form-control" name="content" rows="5">${BoardVO.getContent() }</textarea>
			</div>
			<div class="row">
				<div class="col my-3">
					<p class="lead d-inline mr-2">좋아요&nbsp;&nbsp;${BoardVO.getGood() }</p>
					<p class="lead d-inline ml-2">싫어요&nbsp;&nbsp;${BoardVO.getBad() }</p>
				</div>
			</div>
			<div class="row">
				<button type="button" class="btn btn-dark ml-auto"
					onclick="update_go(this.form)">수정하기</button>
				<button type="button" class="btn btn-dark mx-2"
					onclick="delete_go(this.form)">삭제하기</button>
			</div>
		</div>

		<!-- Comments Form -->
		<div class="card my-4">
			<h5 class="card-header">Leave a Comment</h5>
			<div class="card-body">
				<form method="post" action="cWriteCommand.jsp">
					<div class="form-group">
						<p class="lead">작성자&nbsp;&nbsp;${BoardVO.getId() }</p>
						<textarea class="form-control" name="content" rows="3"></textarea>
					</div>
					<button type="submit" class="btn btn-dark ml-auto">댓글 저장하기</button>
					<input type="hidden" name="bb_idx" value="${BoardVO.bb_idx }">
				</form>
			</div>
		</div>

		<hr>

		<%-- 댓글 출력 --%>
		<div class="output">
			<c:forEach var="CommentVO" items="${cList }">
				<div class="card my-4">
					<h5 class="card-header">Comments</h5>
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
							<button type="submit" class="btn btn-dark">삭제하기</button>
							<input type="hidden" name="bbc_idx" value="${CommentVO.bbc_idx }">
							<input type="hidden" name="content" value="${CommentVO.content }">
							<input type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
						</form>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>