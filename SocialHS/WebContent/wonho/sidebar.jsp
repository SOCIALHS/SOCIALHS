<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.SubLocationVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	List<LocationVO> lo_list = (List<LocationVO>)session.getAttribute("location"); 
	List<SubLocationVO> sub_list = (List<SubLocationVO>)session.getAttribute("SubLocation");
	List<LocationVO> listAll = (List<LocationVO>)session.getAttribute("locationAll");
	List<SubLocationVO> listSubAll = (List<SubLocationVO>)session.getAttribute("listSubAll");
	pageContext.setAttribute("sub_list", sub_list);
	pageContext.setAttribute("lo_list", lo_list);
	pageContext.setAttribute("listAll", listAll);
	
	String[] num = {"One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"};
	pageContext.setAttribute("num", num);
%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
        crossorigin="anonymous">
<title>SideBar</title>
<script>
	
	var num = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"];

	$(function(){
		var l_idx = "${lo_list}";
		var sub = l_idx.substr(19,1);
		begin(num[sub-1]);
	})	
	
	function begin(l_idx){
		document.getElementById(l_idx).className = "collapse show";
		bgBtnChange(l_idx);
	}

	function check(self){		
		document.getElementById(self.name).className = "collapse show";
		var tempNum;
		for(var i = 0; i < num.length; i++){
			if(self.name == num[i]){
				tempNum = i;
			}
		}
		bgBtnChange(num[tempNum]);
		close(tempNum);
	}
	
	function close(idx){
		for(var i = 0; i < num.length; i++){
			if(i != idx){
				document.getElementById(num[i]).className = "collapse";
				resetBgBtn(num[i]);
			}
		}
	}

	function bgBtnChange(idx) {
		document.getElementById("heading" + idx).setAttribute("class", "card-header bg-dark");
		document.getElementById("My" + idx).setAttribute("class", "btn btn-dark");
	}
	
	function resetBgBtn(idx) {
		document.getElementById("heading" + idx).setAttribute("class", "card-header");
		document.getElementById("My" + idx).setAttribute("class", "btn btn-light");
	}
	
</script>
</head> 
<body>
<br><br>
    <div class="row d-block m-0">
    <div class="row">
    	<c:forEach var="listAll" items="${listAll }" varStatus="idx">
        	<div class="accordion" id="accordionExample">
	        <div class="card" style="text-align:center">
	            <div class="card-header" id="heading${num[idx.index] }">
	                <h5 class="mb-0">
	                    <button class="btn btn-light" type="button" name="${num[idx.index] }" data-toggle="collapse" data-target= ${num[idx.index] }
	                        aria-expanded="false" aria-controls="collapseOne" onclick = "check(this)" id="My${num[idx.index] }">
	                        ${listAll.getL_Name() }
	                    </button>
	                </h5>
	            </div>
	
	            <div id=${num[idx.index] } class="collapse" aria-labelledby="heading" data-parent="#accordionExample">
	                <div class="card-body">
	                	<c:forEach var="listSubAll" items="${listSubAll }">
	                		<c:if test="${listSubAll.getL_idx() == listAll.getL_Idx() }"> 
	                   			 <button type="button" class="list-group-item list-group-item-action" style="border:none">${listSubAll.getSl_name() }</button>
	                   		</c:if>
	                    </c:forEach>
	                </div>
	            </div>
	        </div>

    	</div>
   	 </c:forEach>
	</div>



    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
</body>
</html>