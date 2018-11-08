<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp" %>
<%
   } else {
%>
<%@ include file="head.jsp" %>
<% 
   }
%>
    <title>Social Hobby & Study</title>
    <!-- head 태그 -->

</head>
<%
   if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp" %>
<%
   } else {
%>
<%@ include file="jieun/loginheader.jsp" %>
<% 
   }
%>
<!-- body 태그 -->

   <!-- jumbotron -->
   <div class="jumbotron jumbotron-fluid">
      <div class="container text-center">
         <br><br><br>
         <h1 class="display-4">Social Hobby & Study</h1>
         <p class="lead">소셜 하비 앤 스터디에 오신 것을 환영합니다.</p>
         <hr class="my-4">
         <p class="lead">취미나 스터디 모임에 참여하고 싶으시면 아래 버튼을 클릭해 주세요.</p>
         <a class="btn btn-dark btn-lg" href="MainController?type=hobby" role="button">Hobby</a> <a
            class="btn btn-dark btn-lg" href="MainController?type=study" role="button">Study</a>
      </div>
   </div>

   <div id="carouselExampleSlidesOnly" class="carousel slide"
      data-ride="carousel" data-interval="3000">
      <div class="carousel-inner">
         <div class="carousel-item active">
            <img class="d-block w-100" src="imgs/index1.jpg" alt="First slide">
         </div>
         <div class="carousel-item">
            <img class="d-block w-100" src="imgs/index2.jpg" alt="Second slide">
         </div>
         <div class="carousel-item">
            <img class="d-block w-100" src="imgs/index3.jpg" alt="Third slide">
         </div>
      </div>
   </div>



<%@ include file="jieun/footer.jsp" %>