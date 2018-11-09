<%@page import="com.bc.admin.AdminVO"%>
<%@page import="com.bc.member.memberVO"%>
<%@page import="com.bc.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	memberDAO dao = new memberDAO();
	int chk = dao.loginCheck(id, pw);
	String msg = "";
	
	if (chk == 0) {
		//비밀번호가 틀릴 경우->로그인 화면 이동
		System.out.println("비밀번호를 확인해주세요.");
%>
		<script>
			alert("비밀번호를 확인해주세요.");
		</script>
<%
		
		msg = "index.jsp";
	} else if (chk == -1) {
		//아이디가 없을 경우->로그인 화면 이동
		System.out.println("존재하지 않는 아이디입니다.");
%>
		<script>
			alert("존재하지 않는 아이디입니다.");
			
		</script>
<%		
		msg = "index.jsp";
	} else if (chk == 2) {
		//관리자 화면으로 이동
%>
		<script>
			alert("안녕하세요. 관리자 페이지 입니다");
		</script>
<%
		AdminVO avo = dao.selectAid(id);
		session.setAttribute("AdminVO", avo);
		msg = "AdminPage.jsp";
	}
	
	else {
		memberVO vo = dao.selectId(id);
		session.setAttribute("memberVO", vo);
		msg = "index.jsp";
		
	}
	response.sendRedirect(msg);
	
%>
</head>
<body>
</body>
</html>