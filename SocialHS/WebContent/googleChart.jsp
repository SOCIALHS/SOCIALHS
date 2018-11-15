<%@page import="com.bc.main.vo.googleChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% List<googleChartVO> googleHobbyList = (List<googleChartVO>)request.getAttribute("googleHobbyList"); 
	pageContext.setAttribute("googleHobbyList", googleHobbyList);
	
	List<googleChartVO> googleStudyList = (List<googleChartVO>)request.getAttribute("googleStudyList"); 
	pageContext.setAttribute("googleStudyList", googleStudyList);


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
</head>
<body>

	<input type = "button" class = "btn btn-primary" id = "btn" onclick = "drawChart()" value = "chart">
				  
	
				
	<div id="columnchart_material" style="width: 700px; height: 500px;">test</div>			

  
	
	<%--구글차트 --%>
	
	
	<%--구글차트 스크립트 --%>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
	    var hobbyObj;
	    window.onload = function(){
	    	 
	    	  console.log("${googleHobbyList}");
	    	  hobbyObj = new Array();
    	  	  hobbyObj.push(["location","호스팅","스터디"]);
	    	  <c:forEach items = "${googleHobbyList}" var = "vo">
	    		var l_idx = "${vo.l_idx}";
	    		var l_name = "${vo.l_name}";
	    		var number = "${vo.number}";
	    		
	    		var tempObj = [l_name, Number(number)];
	    		hobbyObj.push(tempObj);
    		  </c:forEach>
    		  
    		  
    		  var i = 1;
    		  
    		  <c:forEach items = "${googleStudyList}" var = "vo">
	    		var number = "${vo.number}";
	    		
	    		hobbyObj[i].push(Number(number));
	    		i++;
  		 	  </c:forEach>
    		  
    		  console.log(hobbyObj);
	    	  console.log(hobbyObj.toString());
	      }  
	    
	    
	      google.charts.load('current', {'packages':['bar']});
	      
		//하비와 스터디 구분
	      
	      function drawChart() {
	       
			var data = google.visualization.arrayToDataTable(hobbyObj);
	        var options = {
	          chart: {
	            title: '비트주세요 호스팅 차트',
	            subtitle: 'Location, Hobby, and Study: 2018-2019',
	            animation:{
	                duration: 1000,
	                easing: 'out',
              	}       
	          }
	        };
	
	        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	        google.visualization.events.addListener(chart, 'ready',
	                function() {
	                  //alert("animation");
	                });
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	        
	        var btn = document.getElementById("btn");
	        btn.onclick = function(){
	        	
	        }
	        
	        
	      }
	    </script>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>