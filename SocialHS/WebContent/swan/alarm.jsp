<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function() {
		
		setInterval(
			function MSNAlm() {
				
				$.ajax({
					url: "../AlarmController",
					type: "get",
					dataType: "text",
					success: function(data){
						/* alert("가져온 데이터: "+ data); */
						$("#alarm").html(data);
					},
					error: function(jqXHR, textStatus, errorThrown){
  						alert("실패: \n"
    							+ "jqXHR.readyState: "+ jqXHR.readyState+ "\n"
    							+ "textStatus: "+ textStatus+ "\n"
    							+ "errorThrown: "+ errorThrown);
					}
				});
			}, 3000
		);
		
		
		
		
		
		
	});	
</script>
</head>
<body>
	
	<div id="alarm"></div>
	
	
</body>
</html>