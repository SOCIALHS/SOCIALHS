<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){
	
		$.ajax({
			url: "HSList?type=study",
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
				$("#hoList").html(tbody).trigger("create");
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
<style>.

	ul { list-style-type: none;}
	li {
		list-style-type: none;
	}
	.h_list {
		float: left;
		text-decoration: none;
		color: gray;
	}
/* 	#hoList>li:nth-child(4n+1) {
		clear: left;
	} */
	.h_list:hover{
		color: black;
	}
	#outBox {
		width: 800px;
		height: 200px;
		border: 2px solid black;	
	}
</style>

<h1>취미 리스트</h1>
</head>
<body>
	
	<hr>
	<div id="outBox">
	<ul id="hoList">
	
	</ul>
	</div>
	<hr>
	
		
	
		
	
</body>
</html>