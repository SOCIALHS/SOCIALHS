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

    <title>Social Hobby & Study</title>
</head>

<body>
	<jsp:include page="jieun/header.jsp"></jsp:include>
	
	<%
		String hs = (String)session.getAttribute("hs");
	%>
	
    <!-- jumbotron -->
    <div class="jumbotron jumbotron-fluid">
        <div class="container text-center">
        	<br><br><br>
            <h1 class="display-4">지역을 선택해주세요.</h1>
            <p class="lead">해당 지역에 개설되어 있는 스터디 또는 취미 모임을 보실 수 있습니다.</p>
            <hr class="my-4">
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=01" role="button">서울</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=02" role="button">경기</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=03" role="button">경남</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=04" role="button">경북</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=05" role="button">충남</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=06" role="button">충북</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=07" role="button">전남</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=08" role="button">전북</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=09" role="button">강원</a>
            <a class="btn btn-dark btn-lg btn-block" href="LocationController?hs=${hs }&location=10" role="button">제주</a>
        </div>
    </div>
    
    <jsp:include page="jieun/footer.jsp"></jsp:include>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>

</html>
