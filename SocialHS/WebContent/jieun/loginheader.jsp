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
					dataType: "text",
					success: function(data){
						/* alert("가져온 데이터: "+ data); */
						if (data == 0){
							$("#alarm").attr("class", "badge badge-dark");							
							$("#alarm").html(data);
						} else {
							$("#alarm").attr("class", "badge badge-danger");							
							$("#alarm").html(data);
						}
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
</script>
</head>

<body>
<% session.getAttribute("memberVO"); %>

    <nav class="navbar navbar-dark bg-dark">
        <a class="navbar-brand" style="color:aliceblue;">SHAS (Social Hobby & Study)</a>
        <span class="text-light bg-dark ml-auto mx-2">
        	<b>${memberVO.getName() }</b>&nbsp;님 환영합니다.
        </span>
        <input type="hidden">
        <button type="button" class="btn btn-dark">
            알림<span id="alarm" class="badge badge-dark">0</span>
        </button>
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