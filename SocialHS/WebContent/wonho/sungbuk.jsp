<%@page import="com.bc.main.dao.SubLocationDAO"%>
<%@page import="com.bc.member.Paging"%>
<%@page import="com.bc.member.memberVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.bc.member.memberDAO"%>
<%@page import="com.bc.main.vo.CommentVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.bc.main.vo.SubLocationVO"%>
<%@page import="com.bc.main.vo.LocationVO"%>
<%@page import="com.bc.main.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
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
			
	String sl_idx = request.getParameter("sl_idx");
	pageContext.setAttribute("sl_idx", sl_idx);
	System.out.println("sl_idx : " + sl_idx);
	
%>
<%
	//페이징 처리 
	Paging p = new Paging();
	CommentVO cvo = new CommentVO();
	SubLocationDAO dao = new SubLocationDAO();

	String hs = (String)session.getAttribute("hs");
	hs =  hs.substring(0, 1);
	Map<String, String> map = new HashMap<String, String>();
	map.put("hs", hs);
	map.put("sl_idx", sl_idx);
	
	p.setTotalRecord(dao.getTotCommentCnt(map)); //(수정)게시판별 댓글 조회하는 메소드
	p.setTotalPage(); //전체 페이지 수 구하기
	
	System.out.println("전체 댓글 수 : " + p.getTotalRecord());
	System.out.println("전체 페이지 수 : " + p.getTotalPage());
	
	//2.현재 페이지 구하기
	p.setNowPage(1);
	p.setNumPerpage(5);
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("cPage : " + cPage);
	//3.현재 페이지의 시작번호와 끝 번호 
	p.setBegin((p.getNowPage() - 1) * p.getNumPerpage() +1);
	p.setEnd(p.getBegin() + p.getNumPerpage() -1);
	
	//4. 블록의 시작 페이지, 끝페이지 번호
	p.setBeginPage((p.getNowPage()-1) / p.getPagePerBlock() * p.getPagePerBlock() +1);
	p.setEndPage(p.getBeginPage() + p.getPagePerBlock()-1);
	
	System.out.println("=============================");
	System.out.println("시작 페이지번호(댓글) : " + p.getBeginPage());
	System.out.println("끝 페이지번호(댓글) : " + p.getEndPage());
	System.out.println("=============================");
	
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}	
	System.out.println("변경후 끝 페이지(endPage) : " + p.getEndPage());
%>
<%
	//5.현재 페이지 기준 게시글 가져오기
	Map<String, String> map1 = new HashMap<>();
	String beginNum = String.valueOf(p.getBegin());
	String endNum = String.valueOf(p.getEnd());
	
	map1.put("beginNum", beginNum);
	map1.put("endNum", endNum);
	map1.put("hs", hs);
	map1.put("sl_idx", sl_idx);
	
	System.out.println("시작" + beginNum);
	System.out.println("시작" + endNum);
	System.out.println("시작" + hs);
	System.out.println("시작" + sl_idx);
	
	List<BoardVO> sbList = SubLocationDAO.getBoardCommList(map1);
	pageContext.setAttribute("sbList", sbList); 
	pageContext.setAttribute("pvo", p);
	pageContext.setAttribute("cPage", cPage);
	
	System.out.println("sbList : " + sbList);
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="css/Paging.css" rel="stylesheet" type="text/css">
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
				<thead>
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
					<c:if test="${not empty subBoard }">
						<c:forEach var="sbl" items="${subBoard }">
					  		<tr>
					  			<td>${sbl.getBb_idx() }</td>
					  			<td>${sbl.getTitle() }</td>
					  			<td>${sbl.getContent() }</td>
					  			<td>${sbl.getTime() }</td>
					  			<td>${sbl.getPlace() }</td>
					  		</tr>
					  	</c:forEach>	
					</c:if>
					<c:if test="${empty subBoard }">
						<tr>
							<td colspan="5" class="center">
								등록된 게시글이 없습니다.<br>
								지금 바로 새로운 게시글을 등록해 보세요!
							</td>
						</tr>
					</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<ol class="paging">
						
						<%-- 이전페이지 사용여부 --%>
						<%-- <c:choose>
							사용불가 (첫번째 블록)
							<c:when test="${pvo.beginPage < pvo.pagePerBlock }">
								<li class="disable">&lt;&nbsp;이전&nbsp;</li>
							</c:when>
							
							사용가능
							<c:otherwise>
								<li>
								<a href="SubLocationController?type=moreComment&cPage=${pvo.beginPage-1 }">&lt;&nbsp;이전&nbsp;</a>
								</li>
							</c:otherwise>
						</c:choose>
						
						현재 블록의 시작페이지>끝 페이지 반복처리
						<c:forEach var="k" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${k == pvo.nowPage }">
								<li class="now">${k }</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="SubLocationController?type=moreComment&cPage=${k }">${k }</a>
								</li>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						
						다음페이지
						<c:choose>
							사용불가
							<c:when test="${pvo.endPage >= pvo.totalPage }">
								<li class="disable" id="next">&nbsp;다음&nbsp;&gt;</li>
							</c:when>
							<c:otherwise>
								<li>
								<a href="SubLocationController?type=moreComment&cPage=${pvo.endPage+1 }">&nbsp;다음&nbsp;&gt;</a>
									</li>
							</c:otherwise>
						</c:choose> --%>
						</ol>
					
					</td>
				</tr>
			</tfoot>
			</table>
		</div> 
</body>
</html>