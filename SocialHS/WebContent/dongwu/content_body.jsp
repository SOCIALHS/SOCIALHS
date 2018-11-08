<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="empty"></div>
<c:forEach var="list" items="${MainList }">
	<div class="card text-center my-2 mx-2 positionTop box_width">
		<div class="card-header">${list.bbs_name }</div>
		<div class="card-body">
			<h5 class="card-title">${list.title }</h5>
			<p class="card-text">${list.id }</p>
			<hr>
			<p class="card-text">${list.req_member }</p>
			<p class="card-text">${list.cur_member }</p>
			<hr>
			<p class="card-text">${list.place }</p>
			<p class="card-text">${list.time }</p>
			<a href="HobbyController?type=write&bb_idx=${list.bb_idx }"
				class="btn btn-primary">상세보기</a>
		</div>
		<div class="card-footer text-muted">2 days ago</div>
	</div>
</c:forEach>