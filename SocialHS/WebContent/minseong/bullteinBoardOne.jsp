<%@page import="com.bc.main.dao.CommentDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@page import="com.bc.minseong.command.BullteinBoardDAO"%>
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
	BoardVO bbvo = BullteinBoardDAO.selectOne(bb_idx);
	System.out.println("bb_idx : " + bb_idx);

	List<CommentVO> cList = CommentDAO.getCommList(bb_idx);
	System.out.println("CommentDAO.getCommList(bb_idx) : " + bb_idx);
	System.out.println("cList : " + cList);

	pageContext.setAttribute("cList", cList);
	session.setAttribute("bbvo", bbvo);

	BullteinBoardDAO.updateHit(Integer.parseInt(bb_idx));
%>

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
		frm.action = "BullteinController?type=bullteinUpdate&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
	function delete_go(frm) {
		//frm.action = "Comment?type=b_deleteOk&bb_idx=${BoardVO.getBb_idx() }"
		frm.action = "BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
	function good(frm) {
		frm.action = "BullteinController?type=bullteinGood&bb_idx=${BoardVO.getBb_idx() }"
		frm.submit();
	}
	function bad(frm) {
		frm.action = "BullteinController?type=bullteinBad&bb_idx=${BoardVO.getBb_idx() }"
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
					<th>제목</th>
					<td>${BoardVO.getTitle() }</td>
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
					<td style="height: 200px">${BoardVO.getContent() }</td>
				</tr>
				<tr>
			</tbody>




			<tfoot>
				<tr>
					<td><input type="button" value="GOOD"
						onclick="good(this.form)"></td>
					<td>${BoardVO.getGood() }</td>
				</tr>
				<tr>
					<td><input type="button" value="BAD" onclick="bad(this.form)">
					</td>
					<td>${BoardVO.getBad() }</td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="수정 "
						onclick="update_go(this.form)"> <input type="button"
						value="삭제" onclick="delete_go(this.form)"> <input
						type="hidden" name="cPage" value="${cPage }"></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
<div>

	<hr>

	댓글 목록

	<hr>


	<%-- 댓글 출력 --%>
	<c:choose>
		<c:when test="${empty cList}">
			<tr>
				<td colspan="5">
					<h3>현재 등록된 댓글이 없습니다.</h3>
				</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="CommentVO" items="${cList }">
				<div class="comment">
					<form method="post" action="Comment?type=b_deleteOk">
						<p>댓글번호 : ${CommentVO.bbc_idx }</p>
						<p>작성자 : ${CommentVO.id }</p>
						<p>내용 : ${CommentVO.content }</p>
						<p>작성일 : ${CommentVO.regdate}</p>
						<input type="submit" value="삭제"> <input type="hidden"
							name="bbc_idx" value="${CommentVO.bbc_idx }"> <input
							type="hidden" name="content" value="${CommentVO.content }">
						<input type="hidden" name="bb_idx" value="${CommentVO.bb_idx }">
					</form>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>


	<hr>

	댓글 작성

	<hr>

	<%-- 댓글 입력 --%>
	<form method="post" action="Comment?type=b_writeOk">
		<%
			if (session.getAttribute("memberVO") == null) {
		%>

		<p>작성자: </p>
		<input type="hidden" name="id" value="">

		<%
			} else {
		%>
		
		<p>작성자: ${memberVO.getId() }</p>
		<input type="hidden" name="id" value="${memberVO.getId() }">
		
		<%
			}
		%>

		<p>
			내용 :
			<textarea name="content" rows="4" cols="55"></textarea>
		</p>
		<input type="submit" value="댓글 저장"><input type="hidden"
			name="bb_idx" value="${bbvo.bb_idx }">
		<!-- <input type="hidden" name="cPage" value="${cPage }"> -->
	</form>



</div>

<%@ include file="../jieun/footer.jsp"%>

