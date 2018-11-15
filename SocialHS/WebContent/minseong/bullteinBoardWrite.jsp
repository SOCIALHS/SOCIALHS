<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../head.jsp"%>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<script>
	function write_go(frm) {
		frm.action = "BullteinController?type=bullteinWrite";
		frm.submit();
	}
</script>
</head>

<%@ include file="../jieun/header.jsp"%>


<div id="join" style="padding: 20px;" class="my-2 pt-5 bg-light">
	<form method="post" style="width: 600px;" class="mx-auto" border="1">
		<h3 class="display-5 text-center mb-5">공지사항 작성</h3>
		<div class="col mb-4">
			<div class="row">
				<h4>제목</h4>
				<input type="text" class="form-control" name="title" maxlength="50">
			</div>

			<div class="row">
				<h4>내용</h4>
				<textarea class="form-control" name="content" rows="5" cols="60"></textarea>
			</div>


		</div>
		<div class="row" style="margin-left: 290px">
			<div class="col">
				<input type="button" class="btn btn-danger mb-2 mx-2" value="작성 완료" onclick="write_go(this.form)"> 
				<input type="reset" class="btn btn-danger mb-2 mx-2" value="초기화">
				<input type="hidden" name="chk" value="1">
			</div>
		</div>
	</form>
</div>



<%@ include file="../jieun/footer.jsp"%>