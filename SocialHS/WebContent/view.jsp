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


<title>${hbvo.title }</title>

<!-- NaverMap API -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5jEX8e7bvKVZGhXBRBn9&submodules=geocoder"></script>
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
			<p>${hbvo.bbs_idx }</p>

			<hr>

			<!-- Title -->
			<h1 class="mt-4">${hbvo.title }</h1>

			<!-- Author -->
			<p class="lead">
				by <a href="#">${hbvo.id }</a>
			</p>

			<hr>

			<!-- Date/Time -->
			<p>${hbvo.regdate }</p>

			<hr>

			<!-- reg_member, cur_member                -->
			<p>현재인원 : ${hbvo.cur_member } / 모집인원 : ${hbvo.req_member}</p>

			<hr>

			<!-- time, place                -->
			<p>${hbvo.time },${hbvo.place }</p>

			<hr>

			<!-- Preview Image -->
			<!--  <img class="img-fluid rounded" src="#" alt="img" width="900"
					height="900"> -->

			<div id="map" style="width: 40%; height: 600px;"></div>
			<br>
			<div>
				<input type="button" name="btn" onclick="removeMark()"
					value="호스트 장소 바꾸기">
			</div>


			<hr>

			<!-- Post Content -->
			<p class="lead">${hbvo.content }</p>

			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut,
				tenetur natus doloremque laborum quos iste ipsum rerum obcaecati
				impedit odit illo dolorum ab tempora nihil dicta earum fugiat.
				Temporibus, voluptatibus.</p>

			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos,
				doloribus, dolorem iusto blanditiis unde eius illum consequuntur
				neque dicta incidunt ullam ea hic porro optio ratione repellat
				perspiciatis. Enim, iure!</p>

			<blockquote class="blockquote">
				<p class="mb-0">Lorem ipsum dolor sit amet, consectetur
					adipiscing elit. Integer posuere erat a ante.</p>
				<footer class="blockquote-footer">
					Someone famous in <cite title="Source Title">Source Title</cite>
				</footer>
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
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.
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
					vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
					vulputate fringilla. Donec lacinia congue felis in faucibus.

					<div class="media mt-4">
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

					<div class="media mt-4">
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

				</div>
			</div>

		</div>


		<!-- naver map api등록 -->
		<script>
			var mapOptions = {
				center : new naver.maps.LatLng(37.3595704, 127.105399),
				zoom : 1,
				maxzoom : 0,
				zoomControl : false,
				mapTypeControl : true
			};

			var infoWindow = new naver.maps.InfoWindow({
				anchorSkew : true
			});

			var map = new naver.maps.Map('map', mapOptions);

			map.setCursor('pointer');

			var marker1 = new naver.maps.Marker({ //seoul
				position : new naver.maps.LatLng(37.561190, 126.914008),
				map : map,
			// ,icon: {
			//     url: './icon/seoul.png',
			//     size: new naver.maps.Size(22, 35),
			//     origin: new naver.maps.Point(0, 0),
			//     anchor: new naver.maps.Point(11, 35)
			// }
			});
			marker1.setTitle("seoul");

			var marker2 = new naver.maps.Marker({ //경기도
				position : new naver.maps.LatLng(37.302805, 127.565128),
				map : map
			});
			marker2.setTitle("경기도");
			var marker3 = new naver.maps.Marker({ //강원도
				position : new naver.maps.LatLng(37.791067, 128.219262),
				map : map
			});
			marker3.setTitle("강원도");
			var marker4 = new naver.maps.Marker({ //경상남도
				position : new naver.maps.LatLng(35.515506, 128.824389),
				map : map
			});
			marker4.setTitle("밀양");

			naver.maps.Event.addListener(marker1, 'click', function(e) {
				console.log(e);
				console.log("seoul");
				location.href = "LocationController?location=1"; //이런식으로 보내면 된다.
			});
			naver.maps.Event.addListener(marker2, 'click', function(e) {
				console.log(e);
				console.log("경기도");
			});
			naver.maps.Event.addListener(marker3, 'click', function(e) {
				console.log(e);
				console.log("강원도");
			});
			naver.maps.Event.addListener(marker4, 'click', function(e) {
				console.log(e);
				console.log("경상남도");
			});

			var polyline = new naver.maps.Polyline({
				map : map,
				path : [
						new naver.maps.LatLng(37.359924641705476,
								127.1148204803467),
						new naver.maps.LatLng(37.36343797188166,
								127.11486339569092),
						new naver.maps.LatLng(37.368520071054576,
								127.11473464965819),
						new naver.maps.LatLng(37.3685882848096,
								127.1088123321533),
						new naver.maps.LatLng(37.37295383612657,
								127.10876941680907),
						new naver.maps.LatLng(37.38001321351567,
								127.11851119995116),
						new naver.maps.LatLng(37.378546827477855,
								127.11984157562254),
						new naver.maps.LatLng(37.376637072444105,
								127.12052822113036),
						new naver.maps.LatLng(37.37530703574853,
								127.12190151214598),
						new naver.maps.LatLng(37.371657839593894,
								127.11645126342773),
						new naver.maps.LatLng(37.36855417793982,
								127.1207857131958) ]
			});
			var markTest;
			function marker(y, x) {
				// markTest.setDraggable(true);
				markTest = new naver.maps.Marker({
					position : new naver.maps.LatLng(0, 0),
					map : map,
				});
				markTest.setTitle("host 장소");
				markTest.position["y"] = y;
				markTest.position["x"] = x;
				console.log(markTest.position["y"]);
				console.log(markTest.position["x"]);
			}
			var flag = true;
			var conf;
			naver.maps.Event.addListener(map, 'click', function(e) {
				if (flag) {
					conf = confirm("이곳을 호스트 장소로 입력하겠습니까?!");
				}
				if (conf) {
					flag = false;
					console.log(e);
					console.log("위도 : " + e["coord"]["y"] + " 경도 : "
							+ e["coord"]["x"]);
					var y = e["coord"]["y"];
					var x = e["coord"]["x"];
					marker(y, x);
					conf = false;
				}
				// console.log("위도 :"+e.lating["x"]+", 경도 : "+e.lating["y"]);
			});//map 클릭시 위도와 경도 받기
			function removeMark() {
				markTest.setMap(null);
				flag = true;
			}
		</script>

		<%@ include file="jieun/footer.jsp"%>