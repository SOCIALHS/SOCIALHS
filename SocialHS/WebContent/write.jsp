<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.BbsCodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<BbsCodeVO> bbs_code_list = (List<BbsCodeVO>)request.getAttribute("bbs_code_list");
	pageContext.setAttribute("bbs_code_list", bbs_code_list);
	System.out.println("test:"+bbs_code_list);
	
	List<LocationVO> LocationAll = (List<LocationVO>)request.getAttribute("LocationAll");
	pageContext.setAttribute("LocationAll", LocationAll);
	System.out.println("test2:"+LocationAll);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=5jEX8e7bvKVZGhXBRBn9&submodules=geocoder"></script>
    
    <title>insert</title>
    <script>
    	function send_go(frm){
    		alert("send");
    		alert(frm);
    		frm.method = "post";
    		frm.action = "HobbyController?type=writeOk";
    		frm.submit();	
    	}
    </script>
</head>

<body class="bg-light text-dark">
   
    <div class="container">
        <h1 class="display-4 text-center my-5">모집 글 작성하기</h1>
    </div>
    <form action = "#">
        <div class="row my-3">
            <div class="col ml-5">
                <label for="bbs_idx">카테고리</label>
                <select class="form-control" id="bbs_idx" name = "bbs_idx">
                    <c:forEach var = "bbsCodeVO" items = "${bbs_code_list }">
                    	<option value = "${bbsCodeVO.bbs_idx }">${bbsCodeVO.bbs_name }</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col ml-5">
                <label for="l_idx">지역</label>
                <select class="form-control" id="l_idx" name = "l_idx">
                    <c:forEach var = "LocationVO" items = "${LocationAll }">
                    	<option value = "${LocationVO.l_Idx }">${LocationVO.l_Name }</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="form-group mx-5">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name = "title">
        </div>
        <div class="row">
            <div class="col ml-5">
                <label for="req_member">모집인원</label>
                <input id="req_member" type="number" min=0 class="form-control" name = "req_member">
            </div>
            <div class="col mr-5">
                <label for="time">시간</label>
                <input id="time" type="text" class="form-control" placeholder="구체적인 시간을 필수적으로 입력해주세요." name = "time">
            </div>
        </div>
        <div class="map container my-5" style="width: 600px; height: 500px;">
            <div id="map" style="width:100%; height:500px;"></div>
            <div><button type = "button" class="btn btn-dark mt-2" onclick = "removeMark()">위치 바꾸기</button></div>
        </div>
        <div class="form-group mx-5">
            <label for="place">장소</label>
            <input type="text" class="form-control" id="place" name = "place" placeholder="구체적인 장소를 필수적으로 입력해주세요.">
        </div>

        <div class="form-group mx-5">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name = "content" rows="30"></textarea>
        </div>
        
        <div class="form-group" style="margin-left: 1600px;">
             <button type="reset" class="btn btn-danger">다시 작성하기</button>
             <button type="button" class="btn btn-danger" onclick = "send_go(this.form)">작성 완료</button>
        </div>
        <input type = "hidden" name = "latitude" id = "latitude" value="0">
        <input type = "hidden" name = "longitude" id = "longitude" value="0">
        <input type = "hidden" name = "id" value = "test">
    </form>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script>
		var mapOptions = {
		    center: new naver.maps.LatLng(37.3595704, 127.105399),
		    zoom: 1,
		    maxzoom : 0, 
		    zoomControl: false,
		    mapTypeControl: true
		};
		
		var map = new naver.maps.Map('map', mapOptions);
		
		map.setCursor('pointer');
			
		
		var markTest;
		function marker(y,x){
		    // markTest.setDraggable(true);
		    markTest = new naver.maps.Marker({ 
		        position: new naver.maps.LatLng(0,  0),
		        map: map,
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
		    if(flag){
		       conf = confirm("이곳을 호스트 장소로 입력하겠습니까?!");
		    }
		    if(conf){
		        flag = false;
		        console.log(e);
		        console.log("위도 : "+e["coord"]["y"] + " 경도 : "+e["coord"]["x"]);
		        var y = e["coord"]["y"];
		        var x = e["coord"]["x"];
		        marker(y,x);
		        document.getElementById("latitude").value = x;
                document.getElementById("longitude").value = y;
		        conf = false;
		    }
		    // console.log("위도 :"+e.lating["x"]+", 경도 : "+e.lating["y"]);
		});//map 클릭시 위도와 경도 받기
		function removeMark(){
		    markTest.setMap(null);
		    flag = true;
		}
</script>
</body>

</html>
