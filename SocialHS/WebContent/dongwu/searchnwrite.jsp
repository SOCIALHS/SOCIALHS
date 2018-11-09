<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function write_go() {
		location.href = "Search?type=write";
	}
	
	function search_go(frm){
		frm.action = "Search?type=search";
		frm.submit();
	}
</script>
<form class="form-inline my-3" method="post">
	<div class="form-group">
		<select class="form-control" name="select">
			<option value="0">제목</option>
			<option value="1">작성자</option>
			<option value="3">내용</option>
		</select> 
		
		<input class="form-control mr-sm-2" type="search" placeholder="검색"
			style="width: 500px;" aria-label="Search" name="keyword">
		<button class="btn bg-success text-white my-2 mr-sm-2" onclick="search_go(this.form)">검색</button>
		
	</div>
	
	<button class="btn bg-warning text-white my-2 my-sm-2"
		onclick="write_go()">글 작성하기</button>
</form>
=======
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


>>>>>>> refs/remotes/origin/master
