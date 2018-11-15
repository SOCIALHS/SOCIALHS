<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 작성</title>
<script>
	function write_go(frm) {
		frm.action = "../QNA?type=QNAwrite";
		frm.submit();
	}
</script>
</head>
<body>

<div>
		<h1 class="display-4 my-5 text-center">게시물 작성</h1>
	<hr>
		<form method="post" class="mx-auto" style="width: 1000px;">
			<table class="table">
				<tbody class="tbody-light">
					<tr>
						<div class="form-group">
							<label for="exampleFormControlInput1">작성자</label>
							<p class="lead">${memberVO.id }</p>
						</div>
					</tr>
					<tr>
						<div class="form-group">
							<label for="exampleFormControlInput1">제목</label> <input
								class="form-control" id="exampleFormControlInput1" class="input"
								type="text" name="title">
						</div>
					</tr>

					<tr>
						<div class="form-group">
							<label for="exampleFormControlTextarea1">내용</label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="10" name="content"></textarea>
						</div>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2"><input class="btn btn-dark" type="button"
							value="작성 완료" onclick="write_go(this.form)"> <input
							class="btn btn-dark" type="reset" value="초기화"> <input
							type="hidden" name="id" value="${memberVO.id }"> <input
							type="hidden" name="chk" value="1"></td>
					</tr>
				</tfoot>
			</table>
		</form>
</div>

</body>
</html>