<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% //String id = request.getParameter("id");
	//session.getAttribute("memberVO");
	
%>
<script>
	function idchk(frm) {
		var id1 = frm.id.value;
		var id2 = ${memberVO.getId() };
		
		if (id1 != id2) {
			alert("사용가능한 아이디입니다.");
			frm.id.value = "${id}";
			frm.id.focus();
		} else {
			alert("사용중인 아이디입니다.");
			frm.id.value = "";
			frm.id.focus();
			return false;
		}
		
	}
</script>

</head>
<body>
	
	<a href="../HobbyController?type=photo"><button>테스트</button></a>
	<a href="/error/error.jsp"><button>테스트2</button></a>
	<% session.getAttribute("joinInfo"); %>
	${joinInfo.name }<br>
	${joinInfo.getName() }
	<hr>
<form method="get">
	<table>
		<tbody>
			<tr>
				<td id="title">아이디</td>
				
				<td>
					<input type="text" name="id" maxlength="50" >
					<input type="button" value="중복확인" onclick="idchk(this.form)">
				</td>
			</tr>
		</tbody>
	</table>
</form>
	
</body>
</html>