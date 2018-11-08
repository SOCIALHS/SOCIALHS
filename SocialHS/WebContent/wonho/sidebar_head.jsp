<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.SubLocationVO"%>
<%@page import="java.util.List"%>
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