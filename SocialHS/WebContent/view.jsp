<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% List<CommentVO> commentList = (List<CommentVO>)request.getAttribute("commentList");
   pageContext.setAttribute("commentList", commentList);
   System.out.println("view Page comment : "+commentList);
%>
<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header_head.jsp"%>
<%
	} else {
%>
<%@ include file="head.jsp"%>
<%
	}
%>
<!-- Required meta tags -->
<meta charset="utf-8">
<!-- NaverMap API -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5jEX8e7bvKVZGhXBRBn9&submodules=geocoder"></script>


<title>${viewVO.title }</title>
</head>

<%
	if (session.getAttribute("memberVO") == null) {
%>
<%@ include file="jieun/header.jsp"%>
<%
	} else {
%>
<%@ include file="jieun/loginheader.jsp"%>
<%
	}
%>
<!-- <body>있음 -->
	<!-- Page Content -->
	<div class="container">
		
		<div class="row">

			<!-- Post Content Column -->
			<div class="col-lg">

			<!-- 카테고리                -->
				<p>${viewVO.bbs_name }</p>

				<hr>

				<!-- Title -->
				<h1 class="mt-4">${viewVO.title }</h1>

				<!-- Author -->
				<p class="lead">
					by <a href="#">${viewVO.id }</a>
				</p>

				<hr>

				<!-- Date/Time -->
				<p>${viewVO.regdate }</p>

				<hr>

				<!-- reg_member, cur_member                -->
				<p>현재인원 : ${viewVO.cur_member } / 모집인원 : ${viewVO.req_member}</p>

				<hr>

				<!-- time, place                -->
				<p>${viewVO.time }, ${viewVO.place }</p>

				<hr>

				<!-- Preview Image -->
				<!--  <img class="img-fluid rounded" src="#" alt="img" width="900"
					height="900"> -->
		
			    <div class="img-fluid rounded" id="map" style="width:40%;height:600px;"></div>
			    

				<hr>

				<!-- Post Content -->
				<p class="lead">${viewVO.content }</p>

				<!-- ----------------------------------------------------------------------------------------- -->
				<button type="button" class="btn btn-outline-primary" 
					onclick = "location.href = 'HobbyController?type=update'">수정</button>
				<button type="button" class="btn btn-outline-primary" 
				onclick = "location.href = 'HobbyController?type=deleteOk&bb_idx=${viewVO.bb_idx}'">삭제</button>
				<hr>

				<!-- Comments Form -->
				<div class="card my-4">
					<h5 class="card-header">Leave a Comment:</h5>
					<div class="card-body">
						<form action = "Comment?type=writeOk" method = "post">
							<div class="form-group">
								<textarea class="form-control" rows="3" name = "content"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
							<input type = "hidden" name = "bb_idx" value = "${viewVO.bb_idx }">
							<input type = "hidden" name = "id" value = "test">
							
						</form>
					</div>
				</div>

				<!-- Single Comment -->
				<div class="media mb-4">
					<img class="d-flex mr-3 rounded-circle"
						src="http://placehold.it/50x50" alt="">
					<div class="media-body">
						<h5 class="mt-0">Commenter Name</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					</div>
				</div>
				<c:forEach var = "commentList" items = "${commentList }">
					<!-- Comment with nested comments -->
					<div class="media mb-4">
						<img class="d-flex mr-3 rounded-circle"
							src="http://placehold.it/50x50" alt="">
						<div class="media-body">
							<h5 class="mt-0">${commentList.id }</h5>
							${commentList.content }
						</div>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href = 'Comment?type=deleteOk&bbc_idx=${commentList.bbc_idx}'">삭제</button>
					</div>
				</c:forEach>

			</div>
			</div>
			</div>

		<!-- naver map api등록 -->
			<script>
			var latitude = ${viewVO.latitude};
			var longitude = ${viewVO.longitude};
			var mapOptions = {
				    center: new naver.maps.LatLng(longitude, latitude),
				    zoom: 10,
				    maxzoom : 0, 
				    zoomControl: false,
				    mapTypeControl: true
				};

			var infoWindow = new naver.maps.InfoWindow({
			    anchorSkew: true
			});
			var map = new naver.maps.Map('map', mapOptions);

			map.setCursor('pointer');

			var marker1 = new naver.maps.Marker({ //seoul
			    position: new naver.maps.LatLng(longitude, latitude),
			    map: map
			});
			marker1.setTitle("host장소");		
				
		</script>

		<%@ include file="jieun/footer.jsp"%>
