<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="../head.jsp"%>
<title>쪽지</title>
<style>
#infohead {
	text-align: left;
	width: 800px;
	margin: auto;
}

a {
	color: black;
}

a:hover {
	text-decoration: underline;
	color: orangered;
}

#mypage table {
	/* border: 1px lightgray solid;
		border-collapse: collapse; */
	width: 800px;
	margin: auto;
	padding: 50px;
}

#mypage .center {
	text-align: center;
}

#mypage .right {
	text-align: right;
}

/* 탭 스타일 */
ul.tab {
	width: 800px;
	margin: auto;
	float: left;
	list-style: none;
}

ul.tab li {
	background-color: none;
	color: black;
	display: inline-block;
	cursor: pointer;
}

ul.tab li.current {
	text-decoration: underline;
	color: orangered;
}

.tabcontent {
	display: none;
	width: 800px;
	margin: auto;
}

.tabcontent.current {
	display: inherit;
}

.delBtn {
	color: red;
}
</style>
<script>
	function delOk() {
		var chk = confirm("쪽지를 삭제하시겠습니까?");
		if (chk == true) {
			location.href = 'MessengerController?type=delete'
		} else {
			return false;
		}
	}
</script>
</head>
<%@ include file="../jieun/loginheader.jsp"%>

<div id="mypage" class="container  text-black mx-auto mt-5 align-middle">
	<div class="container text-center">
		<ul id="infohead" class="nav mx-auto my-2">
			<li class="nav-item">내 정보&nbsp;|&nbsp;</li>
			<li class="nav-item"><a href="">Q&A</a>&nbsp;|&nbsp;</li>
			<li class="nav-item"><a href="index.jsp">home</a></li>
		</ul>

		<form method="post">
			<table class="table my-2 mx-auto">
				<thead class="thead-dark">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>등급</th>
						<th>포인트</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="center">${memberVO.getId() }</td>
						<td class="center">${memberVO.getName() }</td>
						<td class="center">${memberVO.getRank() }등급</td>
						<td class="center">${memberVO.getPoint() }point</td>
						<td class="center">${memberVO.getRegdate().substring(0, 10) }</td>
					</tr>
					<tr>
						<td colspan="5" class="right">
							<!-- 						
						<input type="button" name="edit" value="내 정보 수정"
							onclick="editInfo(this.form)">
						<input type="button" name="sendMsg" value="쪽지" 
							onclick="messengerGo(this.form)">
						<input type="button" name="delete" value="탈퇴하기"
							onclick="deleteInfo(this.form)"> 
						<input type="hidden" name="id" value="${memberVO.getId() }">
						<input type="hidden" name="infochk" value="chk">
-->

						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<%-- 최신 글 목록/댓글 목록 보이기(제일 위에 글/댓글 5개만) --%>
		<%-- 내가 쓴 게시글 / 내가 쓴 댓글 /  카페 활동 알림 --%>
		<div>
			<ul class="tab">
				<li class="tablink current" data-tab="allPage">받은 쪽지 함</li>
				<li class="tablink" data-tab="allComment"
					onclick="location.href='/SocialHS/MessengerController?type=write'">쪽지
					보내기</li>
			</ul>
		</div>

		<div id="allPage" class="tabcontent current">
			<table class="table my-2 mx-auto">
				<thead>
					<tr>
						<th class="no">보낸 사람</th>
						<th class="title">제목</th>
						<th class="date">작성일</th>
						<th class="hit">확인</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%-- 리스트에 데이터가 있을 때 --%>
					<c:if test="${not empty msnList}">
						<c:forEach var="list" items="${msnList }">
							<tr>
								<td><span class="badge badge-secondary">${list.send_id }</span></td>
								<td>
								<a href="#"
									onClick="window.open('MessengerController?type=oneList&ms_idx=${list.ms_idx }&chk=${list.chk}','쪽지창', 'width=500px, height=300px')">
										${list.title }
								</a>
								</td>
								<td>${list.regdate.substring(0,10) }</td>
								<c:if test="${list.chk == 1 }">
									<td></td>
								</c:if>
								<c:if test="${list.chk == 0 }">
									<td>&#10004;</td>
								</c:if>
								<td><button type="button" class="btn btn-outline-danger"
										onClick="delOk()">삭제</button></td>

							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty msnList}">
						<tr>
							<td colspan="5" class="center">받은 쪽지가 없습니다.</td>
						</tr>
					</c:if>

				</tbody>
				<tfoot>
					<!-- 					<tr>
						<td colspan="5" class="right"><a href=""><b>더보기&gt;</b></a></td>
					<tr> -->
				</tfoot>
			</table>
		</div>


		<%-- 댓글 --%>
		<div id="allComment" class="tabcontent">
			<table class="table my-2 mx-auto">
				<thead>
					<tr>
						<th>작성자</th>
						<th>댓글단 날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>댓글내용</td>
						<td>글제목</td>
					</tr>
				</tbody>
				<tr>
					<th colspan="5">등록된 댓글이 없습니다.</th>

				</tr>
				<tfoot>
					<tr>
						<td colspan="5" class="right"><a href=""><b>더보기&gt;</b></a></td>
					<tr>
				</tfoot>

			</table>

		</div>

	</div>
</div>


<%@ include file="../jieun/footer.jsp"%>