<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut,
					tenetur natus doloremque laborum quos iste ipsum rerum obcaecati
					impedit odit illo dolorum ab tempora nihil dicta earum fugiat.
					Temporibus, voluptatibus.</p>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Eos, doloribus, dolorem iusto blanditiis unde eius illum
					consequuntur neque dicta incidunt ullam ea hic porro optio ratione
					repellat perspiciatis. Enim, iure!</p>

				<blockquote class="blockquote">
					<p class="mb-0">Lorem ipsum dolor sit amet, consectetur
						adipiscing elit. Integer posuere erat a ante.</p>
					<footer class="blockquote-footer">Someone famous in <cite
						title="Source Title">Source Title</cite> </footer>
				</blockquote>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Error, nostrum, aliquid, animi, ut quas placeat totam sunt tempora
					commodi nihil ullam alias modi dicta saepe minima ab quo voluptatem
					obcaecati?</p>

				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Harum, dolor quis. Sunt, ut, explicabo, aliquam tenetur ratione
					tempore quidem voluptates cupiditate voluptas illo saepe quaerat
					numquam recusandae? Qui, necessitatibus, est!</p>

				<hr>

				<!-- Comments Form -->
				<div class="card my-4">
					<h5 class="card-header">Leave a Comment:</h5>
					<div class="card-body">
						<form>
							<div class="form-group">
								<textarea class="form-control" rows="3"></textarea>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
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

				<!-- Comment with nested comments -->
				<div class="media mb-4">
					<img class="d-flex mr-3 rounded-circle"
						src="http://placehold.it/50x50" alt="">
					<div class="media-body">
						<h5 class="mt-0">Commenter Name</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

						<div class="media mt-4">
							<img class="d-flex mr-3 rounded-circle"
								src="http://placehold.it/50x50" alt="">
							<div class="media-body">
								<h5 class="mt-0">Commenter Name</h5>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
								scelerisque ante sollicitudin. Cras purus odio, vestibulum in
								vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
								nisi vulputate fringilla. Donec lacinia congue felis in
								faucibus.
							</div>
						</div>

						<div class="media mt-4">
							<img class="d-flex mr-3 rounded-circle"
								src="http://placehold.it/50x50" alt="">
							<div class="media-body">
								<h5 class="mt-0">Commenter Name</h5>
								Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
								scelerisque ante sollicitudin. Cras purus odio, vestibulum in
								vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
								nisi vulputate fringilla. Donec lacinia congue felis in
								faucibus.
							</div>
						</div>

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
				
			alert("위도 : "+latitude);
			alert("경도 : "+longitude);
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
<div></div>  
		<%@ include file="jieun/footer.jsp"%>
