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
				
				var tbody = "";
				var alist = data.list;
				var cnt = 0;
				var chk = true;
				$.each(alist, function(member){
					tbody += "<li class='h_list'>";
					tbody += "<a href='#' class='h_list'>";
					tbody += this.h_idx + this.h_name;
					tbody += "&nbsp;";
					tbody += "&nbsp;";
					tbody += "&nbsp;";
					tbody += "&nbsp;";
					tbody += "&nbsp;";
					tbody += "</a>";
					tbody += "</li>";
					
				});
				$("#hoList").html(tbody);
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
<style>
	li {
		list-style-type: none;
	}
	.h_list {
		float: left;
		text-decoration: none;
		color: gray;
	}
	#hoList>li:nth-child(4n+1) {
		clear: left;
		color: blue;
	}
	.h_list:hover{
		color: black;
	}
	.point {
	}
</style>

<h1>취미 리스트</h1>
</head>
<body>
	
	<hr>
	<ul id="hoList">
	
	</ul>
	<hr>
	
		
	
		
	
</body>
</html>