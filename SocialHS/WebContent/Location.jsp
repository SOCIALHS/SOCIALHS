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
	
    <!-- jumbotron -->
    <div class="jumbotron jumbotron-fluid">
        <div class="container text-center">
            <h1 class="display-4">지역을 선택해주세요.</h1>
            <p class="lead">해당 지역에 개설되어 있는 스터디 또는 취미 모임을 보실 수 있습니다.</p>
            <hr class="my-4">
            <button type="button" class="btn btn-dark btn-lg btn-block">서울</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">인천</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">경기</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">경남</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">경북</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">충남</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">충북</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">전남</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">전북</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">강원</button>
            <button type="button" class="btn btn-dark btn-lg btn-block">제주</button>
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
