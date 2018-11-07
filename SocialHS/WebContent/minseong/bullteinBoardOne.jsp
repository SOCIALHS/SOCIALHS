<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 사항</title>
<style>
	#container {
		width: 512px; margin: auto;
	}
	#container h2 { text-align: center; }
	#container p { text-align: center; }
	#container table {
		width: 500px; padding: 0 5px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	#container th, td { border: 1px solid black; }
	#container table th {
		background-color: #9cf;
	}
	#container table td {
		text-align: left;
	}
	#container p > a {
		text-decoration: none;
		font-weight: bold;
	}
	#container .center { text-align: center; }
	
</style>
<script>
	function update_go(frm) {
		//frm.action = "BullteinController?type=bullteinUpdate&bb_idx=${BoardVO.getBb_idx() }";
		frm.action = "BullteinController?type=bullteinUpdate";
		frm.submit();
	}
	function delete_go(frm) {
		frm.action = "BullteinController?type=bullteinDelete&bb_idx=${BoardVO.getBb_idx() }";
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h2>공지 사항</h2>
	<hr>
	<form method="post">
		<table>
		<tbody>
		<tr>
			<th>글번호</th>
			<td>${BoardVO.getBb_idx() }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${BoardVO.getId() }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${BoardVO.getHit() }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${BoardVO.getContent() }</td>
		</tr>
		<tr>
			<th>good</th>
			<td>${BoardVO.getGood() }</td>
		</tr>
		<tr>
			<th>bad</th>
			<td>${BoardVO.getBad() }</td>
		</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="수정 "
						onclick="update_go(this.form)">
					<input type="button" value="삭제"
						onclick="delete_go(this.form)">
				</td>
			</tr>
		</tfoot>	
		</table>
	</form>
</div>

</body>
</html>

