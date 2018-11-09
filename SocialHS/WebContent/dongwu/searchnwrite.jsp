<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function write_go() {
		location.href = "Search?type=write";
	}
</script>
<form class="form-inline my-3" method="post" action="../jieun/search.jsp">
	<div class="form-group">
		<select class="form-control" id="select">
			<option>제목</option>
			<option>작성자</option>
			<option>내용</option>
		</select> 
		
		<input class="form-control mr-sm-2" type="search" placeholder="검색"
			style="width: 500px;" aria-label="Search">
		<button class="btn bg-success text-white my-2 mr-sm-2" type="submit">검색</button>
	</div>
	
	<button class="btn bg-warning text-white my-2 my-sm-2"
		onclick="write_go()">글 작성하기</button>
</form>