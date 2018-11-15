<%@page import="com.bc.minseong.command.QNA_DAO"%>
<%@page import="com.bc.main.dao.CommentDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.main.vo.BoardVO"%>%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header_head.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../head.jsp"%>
<%
	}

	String bb_idx = request.getParameter("bb_idx");
	BoardVO bbvo = QNA_DAO.selectOne(bb_idx);
	System.out.println("bb_idx : " + bb_idx);

	List<CommentVO> cList = CommentDAO.getCommList(bb_idx);
	System.out.println("CommentDAO.getCommList(bb_idx) : " + bb_idx);
	System.out.println("cList : " + cList);

	pageContext.setAttribute("cList", cList);
	session.setAttribute("bbvo", bbvo);

	QNA_DAO.updateHit(Integer.parseInt(bb_idx));
%>

<title>Q&A</title>
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
		frm.action = "QNA?type=QNAupdate&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "QNA?type=QNAdelete&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
	function good(frm) {
		frm.action = "QNA?type=QNAgood&bb_idx=${BoardVO.getBb_idx() }"
		frm.submit();
	}
	function bad(frm) {
		frm.action = "QNA?type=QNAbad&bb_idx=${BoardVO.getBb_idx() }"
		frm.submit();
	}
</script>
</head>

<%
	if (session.getAttribute("memberVO") == null && session.getAttribute("AdminVO") == null) {
%>
<%@ include file="../jieun/header.jsp"%>
<%
	} else if (session.getAttribute("memberVO") != null) {
%>
<%@ include file="../jieun/loginheader.jsp"%>
<%
	} else if (session.getAttribute("AdminVO") != null) {
%>
<%@ include file="../Admin/A_loginheader.jsp"%>
<%
	}
%>

<!--  <BODY>  -->

<div id="container">
	<h1 class="display-4 my-5 text-center">Q&A</h1>
	<hr>

	<form method="post">
		<table class="table">
			<tr>
				<th scope="col" class="bg-light"><p class="lead text-center">글번호</p></th>
				<td scope="row"><p class="lead">${BoardVO.getBb_idx() }</p>
				</th>
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
				<input type="submit" class="btn btn-info mx-2 ml-auto"
					onclick="good(this.form)" value="좋아요">
				<p class="lead mx-2">${BoardVO.getGood() }</p>
				<input type="submit" class="btn btn-danger mx-2"
					onclick="bad(this.form)" value="별로에요">
				<p class="lead mx-2">${BoardVO.getBad() }</p>
			</div>
		</div>

		<div class="form-group">
			<input type="submit" class="btn btn-dark"
				onclick="update_go(this.form)" value="수정하기"> <input
				type="submit" class="btn btn-dark" onclick="delete_go(this.form)"
				value="삭제하기"> <input type="hidden" name="cPage"
				value="${cPage }">
		</div>
	</form>
</div>

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
			<input type="hidden" name="bb_idx" value="${bbvo.bb_idx }">
			<!-- <input type="hidden" name="cPage" value="${cPage }"> -->
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
						<input type="hidden" name="bbc_idx" value="${CommentVO.bbc_idx }">
						<input type="hidden" name="content" value="${CommentVO.content }">
						<input type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
					</form>
				</div>
			</div>
		</c:forEach>
	</c:otherwise>
</c:choose>
</div>

<%@ include file="../jieun/footer.jsp"%>