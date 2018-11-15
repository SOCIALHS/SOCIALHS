<%@page import="com.bc.main.dao.CommentDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="com.bc.minseong.command.FreeBoardDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<style>
th {
	width: 30%;
}

td {
	width: 70%;
}
</style>
<%
	String

	bb_idx

			= request.getParameter("bb_idx");

	BoardVO

	bbvo

			= FreeBoardDAO.selectOne(bb_idx);

	List<CommentVO> cList

			= CommentDAO.getCommList(bb_idx);

	pageContext.setAttribute("cList", cList);

	session.setAttribute("bbvo", bbvo);

	FreeBoardDAO.updateHit(Integer.parseInt(bb_idx));
%>

<script>
	function update_go(frm) {
		//frm.action = "FreeController?type=freeUpdate&bb_idx=${BoardVO.getBb_idx() }";
		frm.action = "minseong/freeBoardUpdate.jsp";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "FreeController?type=freeDelete&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
	function good(frm) {
		frm.action = "FreeController?type=freeGood&bb_idx=${BoardVO.getBb_idx() }"
		frm.submit();
	}
	function bad(frm) {
		frm.action = "FreeController?type=freeBad&bb_idx=${BoardVO.getBb_idx() }"
		frm.submit();
	}
</script>
</head>
<body>
<div id="container" class="mx-auto" style="width: 1000px">
	<h1 class="display-3 my-5 text-center">자유 게시판</h1>
	<hr>
	<form method="post">
		<table class="table">
			<tr>
				<th scope="col" class="bg-light"><p class="lead text-center">글번호</p></th>
				<td scope="row"><p class="lead">${BoardVO.getBb_idx() }</p>
				
			</tr>
			<tr>
				<th scope="col" class="bg-light"><p class="lead text-center">제목</p></th>
				<td><p class="lead">${BoardVO.getTitle() }</p></td>
			</tr>
			<tr>
				<th scope="col" class="bg-light"><p class="lead text-center">작성자</p></th>
				<td><p class="lead">${BoardVO.getId() }</p></td>
			</tr>
			<tr>
				<th scope="col" class="bg-light"><p class="lead text-center">조회수</p></th>
				<td><p class="lead">${BoardVO.getHit() }</p></td>
			</tr>
			<tr>
				<th scope="col" class="bg-light"><p class="lead text-center">내용</p></th>
				<td><p class="lead">${BoardVO.getContent() }</p></td>
			</tr>
		</table>
	
		<div class="form-group">
			<div class="row">
				<input type="submit" class="btn btn-info mx-2 ml-auto" onclick="good(this.form)" value="좋아요">
				<p class="lead mx-2">${BoardVO.getGood() }</p>
				<input type="submit" class="btn btn-danger mx-2" onclick="bad(this.form)" value="별로에요">
				<p class="lead mx-2">${BoardVO.getBad() }</p>
			</div>
		</div>
		<div class="form-group">
			<input class="btn btn-dark" type="button" onclick="update_go(this.form)" value="수정하기"> 
			<input class="btn btn-dark" type="button" onclick="delete_go(this.form)" value="삭제하기">
		</div>
	</form>

		<%-- 댓글 입력 --%>
		<div class="card my-4">
			<h5 class="card-header">댓글 달기</h5>
			<div class="card-body">
				<form method="post" action="Comment?type=f_writeOk">
					<%
						if (session.getAttribute("memberVO") == null) {
					%>

					<p class="lead">작성자:</p>
					<input type="hidden" name="id" value="">

					<%
						} else {
					%>

					<p class="lead">작성자: ${memberVO.getId() }</p>
					<input type="hidden" name="id" value="${memberVO.getId() }">

					<%
						}
					%>

					<div class="form-group">
						<textarea class="form-control" rows="3" name="content"></textarea>
					</div>
				<%--<input type="hidden" name="bb_idx" value="${bbvo.bb_idx }">--%>
					<input type="hidden" name="bb_idx" value="${BoardVO.bb_idx }">
					<input type="hidden" name="cPage" value="${cPage }">
					<input type="submit" class="btn btn-dark" value="댓글 저장하기">
				</form>
			</div>
		</div>


		<hr>
		<p class="lead">댓글 보기</p>
		<hr>

		<%-- 댓글 출력 --%>
		<c:choose>
			<c:when test="${empty cList}">
				<p class="lead">현재 등록된 댓글이 없습니다.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="CommentVO" items="${cList }">
					<div class="card my-4">
						<h5 class="card-header">Leave a Comment:</h5>
						<div class="card-body">
							<form method="post" action="Comment?type=f_deleteOk">
								<p class="lead">댓글번호 : ${CommentVO.bbc_idx }</p>
								<p class="lead">작성자 : ${CommentVO.id }</p>
								<p class="lead">내용 : ${CommentVO.content }</p>
								<p class="lead">작성일 : ${CommentVO.regdate}</p>
								<button type="submit" class="btn btn-danger">삭제</button>
								<input type="hidden" name="bbc_idx"
									value="${CommentVO.bbc_idx }"> <input type="hidden"
									name="content" value="${CommentVO.content }"> <input
									type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
							</form>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>