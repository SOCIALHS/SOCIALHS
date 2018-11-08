<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../head.jsp"%>
<title>쪽지 작성</title>
<script>
	function checkId() {
		var recv_id = document.getElementById("recv_id").value;
		$.ajax({
			url : "/SocialHS/MsnIdCheckController?&id=" + recv_id,
			type : "get",
			dataType : "text",
			success : function(data) {
				var chk = false;
				if (data == 1) { // id가 존재함
					chk = true;
					alert("id 확인 완료");
					$("#subBtn").css("display", "block");
				} else if (data == 0) {
					chk = false;
					alert("존재하지 않는 ID입니다");
					$("#subBtn").css("display", "none");
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("실패: \n" + "jqXHR.readyState: " + jqXHR.readyState
						+ "\n" + "textStatus: " + textStatus + "\n"
						+ "errorThrown: " + errorThrown);
			}
		});
	}
</script>
<style type="text/css">
#idChk {
	font-size: 9px;
}

#subBtn {
	display: none;
}

form {
	margin: auto;
}
</style>
</head>
<%@ include file="../jieun/loginheader.jsp"%>

<div class="mx-auto my-2 bg-light p-2" style="width: 600px">
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<h1 class="display-4 my-5 text-center">쪽지 보내기</h1>

	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="받는 사람"
			aria-label="Recipient's username" aria-describedby="button-addon2">
		<div class="input-group-append">
			<button class="btn btn-outline-dark" type="button" id="button-addon2">수신자
				여부 확인</button>
		</div>
	</div>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text" id="basic-addon1">제목</span>
		</div>
		<input type="text" class="form-control" aria-label="Username"
			aria-describedby="basic-addon1">
	</div>
	<div class="input-group">
		<div class="input-group-prepend">
			<span class="input-group-text">내용</span>
		</div>
		<textarea class="form-control" aria-label="With textarea" rows="10"></textarea>
	</div>
	<div class="footer my-4" style="margin-left: 420px">
		<button type="button" class="btn btn-dark" data-dismiss="modal">창닫기</button>
		<button type="button" class="btn btn-primary" formmethod="post"
			onclick="location.href='MessengerController?type=writeOk'">보내기</button>
	</div>
</div>
<form method="post" action="MessengerController?type=writeOk">
	<table>
		<tr>
			<td>
				<div class="input-group mb-3">
					<input id="recv_id" name="recv_id" type="text" class="form-control"
						placeholder="UserId" aria-label="UserId"
						aria-describedby="button-addon2">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button"
							id="button-addon2 idChk" onClick="checkId()">id 확인</button>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">제 목</span>
					</div>
					<input id="title" name="title" type="text" class="form-control"
						placeholder="Title" aria-label="Username"
						aria-describedby="basic-addon1">
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
					<textarea name="content" class="form-control"
						aria-label="With textarea" placeholder="Content"></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td><button type="submit" class="btn btn-secondary" id="subBtn">보내기</button></td>
		</tr>
	</table>
</form>
<%@ include file="../jieun/footer.jsp"%>
