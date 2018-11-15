<%@page import="com.bc.main.vo.googleChartVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% List<googleChartVO> googleList = (List<googleChartVO>)request.getAttribute("googleList"); 
pageContext.setAttribute("googleList", googleList);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<%--구글차트 --%>
	<div id="googleChart" class="tabcontent">
		<div id="columnchart_material" style="width: 800px; height: 500px;"></div>  
	</div>
	
	<%--구글차트 스크립트 --%>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	    <script type="text/javascript">
	    var obj;
	    window.onload = function(){
	    	  alert("hi");
	    	  alert("${googleList}");
	    	  console.log("${googleList}");
	    	  obj = new Array();
	    	  <c:forEach items = "${googleList}" var = "vo">
	    		var l_idx = "${vo.l_idx}";
	    		var l_name = "${vo.l_name}";
	    		var number = "${vo.number}";
	    		var tempObj = {"l_idx" : l_idx, "l_name" : l_name, "number" : number};
	    		obj.push(tempObj);
    		  </c:forEach>
    		  
    		  console.log(obj);
	    	  
	      }  
	    
	    
	      google.charts.load('current', {'packages':['bar']});
	      google.charts.setOnLoadCallback(drawChart);
		//하비와 스터디 구분
	      
	      function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['location', 'EA', ],
	          [obj[0]["l_name"], obj[0]["number"]]);
	
	        var options = {
	          chart: {
	            title: 'Company Performance',
	            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
	          }
	        };
	
	        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
	
	        chart.draw(data, google.charts.Bar.convertOptions(options));
	      }
	    </script>

</body>
</html>