<%@page import="com.bc.study.command.CategoryCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<script>
window.onload = function(){
	alert("TEst");
	var request = new XMLHttpRequest();
	request.onreadystatechange = function(){
		if(request.readyState == 4 && request.status == 200){
			var json = JSON.parse(request.responseText);
			alert("json check");
			alert(json);
			console.log(json);
			var output = "<br><br><br>";
			console.log("asdfadsf");
			var count = 0;
			console.log(json["list"]);
			var list = json["list"];
			for(var i = 0; i < list.length; i++){
				count++;
				console.log("cnt : "+count);
				//output += "<p>";
				for(var key in list[i]){
					output += list[i][key] + "&nbsp;";
				}
				output += "&nbsp;&nbsp;&nbsp;&nbsp;";
				console.log("output "+output);
			}
			var test = document.getElementById("test");
			//category.innerHTML(output);
			document.getElementById("category").innerHTML=output;
			//document.body.innerHTML += output;
		}
	};
	var hs = "${hs}";
	console.log(hs);
	if(hs == "hobby"){
		request.open("GET","HSList?type=hobby",true);
		request.send();
	}else if(hs == "study"){
		request.open("GET","HSList?type=study",true);
		request.send();
	}
}
</script>

	<div id="category">

	</div>
