<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	
		$.ajax({
			url: "HobbyList",
			type: "get",
			dataType: "JSON",
			success: function(data) {
				alert("전달받은 결과값: " + data);
				
				var tbody = "";
				var alist = data.list;
				$.each(alist, function(member){
					tbody += "<tr>";
					tbody += "<td>" + this.h_idx+ "</td>";		// JSON객체.속성명
					tbody += "<td>" + this.h_name+ "</td>";
					tbody += "</tr>";
				});
				$("#tbody").html(tbody);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패: \n"
					+ "jqXHR.readyState: "+ jqXHR.readyState+ "\n"
					+ "textStatus: "+ textStatus+ "\n"
					+ "errorThrown: "+ errorThrown);
			}
		});
		
		
});
</script>

<h1>취미 리스트</h1>
</head>
<body>
	
	
	<table>
	<tbody id="tbody">
	
	</tbody>
	</table>
	
	
	
	
		
	
		
	
</body>
</html>