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
					$("#idChk").css("color", "green");
					$("#idChk").html("ID 확인 완료");
				} else if (data == 0) {
					chk = false;
					$("#idChk").css("color", "red");
					$("#idChk").html("존재하지 않는 ID입니다");
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
				<button class="btn btn-outline-dark" type="button"
					id="button-addon2">수신자 여부 확인</button>
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
			<button type="button" class="btn btn-primary" formmethod="post" onclick="location.href='MessengerController?type=writeOk'">보내기</button>
		</div>
	</div>




	</body>
	</html>