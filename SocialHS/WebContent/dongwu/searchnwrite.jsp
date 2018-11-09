<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function write_go(){
		location.href="../HobbyController?type=write";
	}

</script>
<form class="form-inline my-3">
	<div class="input-group-prepend mr-sm-2">
		<button class="btn btn-outline-dark dropdown-toggle" type="button"
			data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</button>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="#">제목</a> <a class="dropdown-item"
				href="#">내용</a> <a class="dropdown-item" href="#">작성자</a>
		</div>
	</div>
	<input class="form-control mr-sm-2" type="search" placeholder="검색" style="width: 500px;"
		aria-label="Search">
	<button class="btn bg-success text-white my-2 mr-sm-2" onclick="write_go()">검색</button>
	<input type = "button" class = "btn bg-warning text-white" onclick = "location.href = 'HobbyController?type=write&bb_idx=${list.bb_idx }'" value = "글 작성하기">
</form>


