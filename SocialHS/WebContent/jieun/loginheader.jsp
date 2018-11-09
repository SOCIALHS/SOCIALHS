<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="bg-light text-dark">

    <nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand" href="index.jsp"> <img
			src="imgs/networking.png" width="30"
			height="30" class="d-inline-block align-top" alt="logo">
			&nbsp;Social Hobby & Study
		</a>
        <span class="text-light bg-dark ml-auto mx-2">
        	<b>${memberVO.id }</b>&nbsp;님 환영합니다.
        </span>
        <input type="hidden">
        <div id="almOutter">
        <button id="almBtn" type="button" class="btn btn-dark">
            알림<span id="almCnt" class="badge badge-dark">0</span>
        </button>
        <div id="newAlm">
        	
        </div>
        </div>
        <ul class="nav justify-content-end">
            <li class="nav-item">
                <a class="nav-link text-light" href="MypageController?type=myPage">마이페이지</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-light" href="memberController?type=logout">로그아웃</a>
            </li>
        </ul>
    </nav>
    <br><br><br>
