<%@page import="com.bc.member.memberDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.main.vo.SubLocationVO"%>
<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//보드
	List<BoardVO> SubBoard = (List<BoardVO>)session.getAttribute("subBoard");
	//현재 location 페이지
	List<LocationVO> lo_list = (List<LocationVO>)session.getAttribute("location");
	//sublocation 페이지
	List<SubLocationVO> subList = (List<SubLocationVO>)session.getAttribute("SubLocation");
	//System.out.println("SubBoard : " + SubBoard);
	System.out.println("lo_list : " + lo_list);
	System.out.println("subList : " + subList);
	
	pageContext.setAttribute("SubBoard", SubBoard);
	pageContext.setAttribute("lo_list", lo_list);
	pageContext.setAttribute("subList", subList);
	
	int sl_idx = Integer.parseInt(request.getParameter("sl_idx"));
	pageContext.setAttribute("sl_idx", sl_idx);
	System.out.println("sl_idx : " + sl_idx);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<style>
	#infohead {
		text-align: left;
		width: 800px; margin: auto;
	}
	
	a { color: black; }
	a:hover {
		text-decoration: underline;
		color: orangered;
	}
	
	#mypage table {
		/* border: 1px lightgray solid;
		border-collapse: collapse; */
		width: 800px; margin: auto; padding: 50px;
	}
	
	#mypage .center { text-align: center; }
	#mypage .right { text-align: right; }
	#mypage .left { text-align: left; }
	
	/* 탭 스타일 */
	ul.tab {
		width: 800px; margin: auto;
		float: left;
		list-style: none;
	}
	ul.tab li {
		background-color: none;
		color: black;
		display: inline-block;
		cursor: pointer;
	}
	
	ul.tab li.current {
		text-decoration: underline;
		color: orangered;
	}
	
	.tabcontent {
		display: none;
		width: 800px; margin: auto;
		
	}
	.tabcontent.current {
		display: inherit;
	}
	
	h3 {
		text-align : center;
	}
	
	.form-inline {
		width : 800px;
		margin : auto;
	}
</style>
</head>
<body>

	<%-- <h2>${lo_list[0].getL_Name() }  
	<c:forEach var ="s" items="${subList }">
		<c:if test="${s.getSl_idx()  == sl_idx }">
			${s.getSl_name() }
		</c:if>
	</c:forEach>
	</h2> --%>
	<%-- <form class="form-inline my-3">
	  <div class="form-group">
	      <select class="form-control" id="select">
	        <option>제목</option>
	        <option>작성자</option>
	        <option>내용</option>
	     </select>
	  </div>
	  <input class="form-control mr-sm-2" type="search" placeholder="검색"
	     style="width: 500px;" aria-label="Search">
	     
	  <button class="btn bg-success text-white my-2 mr-sm-2"
	     onclick="write_go()">검색</button>
	   <button class="btn bg-warning text-white my-2 my-sm-2" type="submit">글
	      작성하기</button>
	</form>
	<table class="table">
	  <thead class="thead-dark">
	  		<th scope="col">BB_IDX</th>
	  		<th scope="col">Title</th>
	  		<th scope="col">Content</th>
	  		<th scope="col">Time</th>
	  		<th scope="col">Place</th>
	    <!-- <tr>
	      <th scope="col">#</th>
	      <th scope="col">First</th>
	      <th scope="col">Last</th>
	      <th scope="col">Handle</th>
	    </tr> -->
	  </thead>
	  <tbody>
	  <c:forEach var="sbl" items="${SubBoard }">
	  		<tr>
	  			<td>${sbl.getBb_idx() }</td>
	  			<td>${sbl.getTitle() }</td>
	  			<td>${sbl.getContent() }</td>
	  			<td>${sbl.getTime() }</td>
	  			<td>${sbl.getPlace() }</td>
	  		</tr>
	  </c:forEach>
	    <!-- <tr>
	      <th scope="row">1</th>
	      <td>Mark</td>
	      <td>Otto</td>
	      <td>@mdo</td>
	    </tr>
	    <tr>
	      <th scope="row">2</th>
	      <td>Jacob</td>
	      <td>Thornton</td>
	      <td>@fat</td>
	    </tr>
	    <tr>
	      <th scope="row">3</th>
	      <td>Larry</td>
	      <td>the Bird</td>
	      <td>@twitter</td>
	    </tr> -->
	  </tbody>
	</table> --%>
<!-- ------------------------------------------------------------------------------------ -->
		<h3>
			&lt;${lo_list[0].getL_Name() }  
			<c:forEach var ="s" items="${subList }">
				<c:if test="${s.getSl_idx()  == sl_idx }">
					${s.getSl_name() }
				</c:if>
			</c:forEach>
			&gt;
		</h3>
		
		<form class="form-inline my-3">
		  <div class="form-group">
		      <select class="form-control" id="select">
		        <option>제목</option>
		        <option>작성자</option>
		        <option>내용</option>
		     </select>
		  </div>
		  <input class="form-control mr-sm-2" type="search" placeholder="검색" style="width: 500px;" aria-label="Search">
		     
		  <button class="btn bg-success text-white my-2 mr-sm-2" onclick="write_go()">검색</button>
		  <button class="btn bg-warning text-white my-2 my-sm-2" type="submit">글작성하기</button>
		</form>
		
		<div id="allPage" class="tabcontent current">
			<table class="table my-2 mx-auto">
				<thead >
					<tr>
						<th class="no">BB_IDX</th>
						<th class="title">TITLE</th>
						<th class="writer">Content</th>
						<th class="date">Time</th>
						<th class="hit">Place</th>
					</tr>
				</thead>
				<tbody>
					<%-- 리스트에 데이터가 있을 때 --%>
					<c:if test="${not empty SubBoard }">
						<c:forEach var="sbl" items="${SubBoard }">
					  		<tr>
					  			<td>${sbl.getBb_idx() }</td>
					  			<td>${sbl.getTitle() }</td>
					  			<td>${sbl.getContent() }</td>
					  			<td>${sbl.getTime() }</td>
					  			<td>${sbl.getPlace() }</td>
					  		</tr>
					  	</c:forEach>	
					</c:if>
					<c:if test="${empty SubBoard }">
						<tr>
							<td colspan="5" class="center">등록된 게시글이 없습니다.<br>
								지금 바로 새로운 게시글을 등록해 보세요!</td>
						</tr>
					</c:if>
			</tbody>
			</table>
		</div>
		
		</div>
	</div>
</body>
</html>