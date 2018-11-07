<%@page import="com.bc.study.command.CategoryCommand"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>Social Hobby & Study</title>

</head>
<body>
	<script>
		window.onload = function() {
			alert("TEst");
			var request = new XMLHttpRequest();
			request.onreadystatechange = function() {
				if (request.readyState == 4 && request.status == 200) {
					var json = JSON.parse(request.responseText);
					alert("json check");
					alert(json);
					console.log(json);
					var output = "<br><br><br>";
					console.log("asdfadsf");
					var count = 0;
					console.log(json["list"]);
					var list = json["list"];
					
					output += "<table class=\"table table-info\">";

					for (var i = 0; i < list.length; i++) {

						if (count % 5 == 0) {
							output += "<tr class=\"text-center\">";
						}
						output += "<td class=\"border border-white\"><a href=\"#\">";
						for ( var key in list[i]) {
							output += list[i][key] + "&nbsp;";
						}
						count++;
						console.log("cnt : " + count);
						output += "</a></td>";
						//output += "&nbsp;&nbsp;&nbsp;&nbsp;";
						//console.log("output "+output);

						if (count % 5 == 0) {
							output += "</tr>";
						}

					}
					output += "</table>";
					
					var test = document.getElementById("test");
					//category.innerHTML(output);
					document.getElementById("category").innerHTML = output;
					//document.body.innerHTML += output;
				}
			};
			var hs = "${hs}";
			console.log(hs);
			if (hs == "hobby") {
				request.open("GET", "HSList?type=hobby", true);
				request.send();
			} else if (hs == "study") {
				request.open("GET", "HSList?type=study", true);
				request.send();
			}
		}
	</script>

	<div id="category" style="width: 100%;"></div>

	<!--<jsp:include page="../hsList.jsp"></jsp:include> -->

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>