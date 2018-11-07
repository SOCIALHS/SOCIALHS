<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지 작성</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
	function checkId() {
		var recv_id = document.getElementById("recv_id").value;
		$.ajax({
			url : "/SocialHS/MsnIdCheckController?&id=" + recv_id,
			type : "get",
			dataType : "text",
			success : function(data) {
				var chk = false;
				if (data == 1){ 	// id가 존재함
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
	#idChk{ font-size: 9px; }
</style>
</head>
<body>

	<h1>여긴 쪽지 작성 페이지</h1>
	<form method="post" action="MessengerController?type=writeOk">
		<table>
			<tr>
				<th>받는이</th>
				<td><input type="text" name="recv_id" id="recv_id"></td>
				<td><input type="button" onClick="checkId()" value="id확인"><span id="idChk"></span></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colsepan="2"><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2"><textarea rows="15" cols="40" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="발송" id="submit"></td>
			</tr>
		</table>
	</form>




</body>
</html>