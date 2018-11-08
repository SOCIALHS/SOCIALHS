<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<script>
function delete() {
	location.href = "../BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }";
	
}
</script>	
</head>
<body onload="delete()">
	<h3>delete</h3>
</body>
</html>