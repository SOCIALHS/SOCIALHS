<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function write_go(){
		location.href="../StudyController?type=write";
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
	<button class="btn bg-warning text-white my-2 my-sm-2" type="submit">글
		작성하기</button>
</form>