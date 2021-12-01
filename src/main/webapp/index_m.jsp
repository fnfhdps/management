<%--관리자 메뉴--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	int userID = 0;
	
	if(session.getAttribute("userID") != null){
		userID = (Integer)session.getAttribute("userID");
	}
	if(userID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'login.jsp';");
		script.println("</script>");
		script.close();
	}
	
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기숙사 관리 홈페이지</title>
	<link rel="stylesheet" href="./main.css">
</head>
<body>
	<div id="wrap">
		<header>
				<h1>기숙사 관리 홈페이지</h1>
		</header>
		<nav>
			<ul>
				<li><a href="information_m.jsp">학생정보</a></li>
				<li><a href="sleepOut_m.jsp">외박관리</a></li>
				<li><a href="inquiry_m.jsp">문의사항</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>
