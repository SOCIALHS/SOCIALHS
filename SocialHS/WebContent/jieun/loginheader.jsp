<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
    <title>Social Hobby & Study</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
		setInterval(
			function Alm() {
				
				$.ajax({
					url: "../AlarmController",
					type: "get",
					dataType: "JSON",
					success: function(data){
						
						var msnList = data.msnAlm;
						var memList = data.memAlm;
						var comList = data.comAlm;
						
						var newAlm = "";
						newAlm += "<b>모집 알람<b>";	
						newAlm += "<hr>";
						$.each(memList, function(member){
							console.log(this.title);
							console.log(this.content);
							newAlm += '"'+ this.title+'"'+ "모집글에 신청 알림<br>";
						});
						newAlm += "<br><br>";
						newAlm += "<b>쪽지 알람<b>";	
						newAlm += "<hr>";
						$.each(msnList, function(member){
							newAlm += '"'+ this.send_id+'"'+ "님께서 보낸 쪽지 알림<br>";
							console.log(this.title);
							console.log(this.content);
						});
						newAlm += "<br><br>";
						newAlm += "<b>댓글 알람<b>";	
						newAlm += "<hr>";
						$.each(comList, function(member){
							newAlm += '"'+ this.title+'"'+ "글에 댓글 알림<br>";
							console.log(this.title);
							console.log(this.content);
						});
						newAlm += "<br><br>";
							console.log(newAlm);
						$("#newAlm").html(newAlm);
						/* alert("가져온 데이터: "+ data); */
						if (data.alm == 0){
							$("#alarm").attr("class", "badge badge-dark");							
							$("#alarm").html(data.alm);
						} else {
							$("#alarm").attr("class", "badge badge-danger");							
							$("#alarm").html(data.alm);
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
  						console.log("실패: \n"
    							+ "jqXHR.readyState: "+ jqXHR.readyState+ "\n"
    							+ "textStatus: "+ textStatus+ "\n"
    							+ "errorThrown: "+ errorThrown);
					}
				});
			}, 3000
		);
</script>
<script>
	$(document).ready(function() {
		var btnChk = true;
		$("#almBtn").on("click", function(){
			if (btnChk == true){
				$("#newAlm").css("display", "block");
				btnChk = false;
			} else {
				$("#newAlm").css("display", "none");
				btnChk = true;
			}
		});
	});
</script>
<style>
	#newAlm {
	    display: none;
	    position: absolute;
	    background-color: #f9f9f9;
	    width: 250px; height: 160px;
	    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	    padding: 12px 16px;
	    z-index: 1; 
	    overflow: auto;
		word-wrap: break-word;
		text-size: 9px;
	}
	#almOutter {
	    position: relative;
    	display: inline-block;
	}
	#inner {
		display: block;
	}
</style>
</head>

<body>
<% session.getAttribute("memberVO"); %>

    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" style="color:aliceblue;">SHAS (Social Hobby & Study)</a>
        <span class="text-light bg-dark ml-auto mx-2">
        	<b>${memberVO.getName() }</b>&nbsp;님 환영합니다.
        </span>
        <input type="hidden">
        <div id="almOutter">
        <button id="almBtn" type="button" class="btn btn-dark">
            알림<span id="alarm" class="badge badge-dark">0</span>
        </button>
        <div id="newAlm">
        	
        </div>
        </div>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link text-light" href="mingyeong/myPage.jsp">마이페이지</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-light" href="memberController?type=logout">로그아웃</a>
            </li>
        </ul>
    </nav>


</body>

</html>