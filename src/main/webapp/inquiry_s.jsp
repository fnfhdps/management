<%--문의사항 입력&조회--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="inquiry.InquiryDTO"%>
<%@ page import="inquiry.InquiryDAO"%>
<%@ page import="java.util.ArrayList"%>
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
				<li><a href="information_s.jsp">내정보</a></li>
				<li><a href="sleepOut_s.jsp">외박신청</a></li>
				<li><a href="inquiry_s.jsp">문의사항</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul>
		</nav>
		
		<section class="bb">
			<h3>문의사항</h3>
			<form method="post" action="./inquiryInsertAction.jsp">
				<div class="info_insert">
					<label for="write"><br><br>작성</label><br>
					<input type="text" name="write" style="height: 150px; width: 280px">
					<br><br><input class="bt" type="submit" value="저장">
				</div>
			</form>
		</section>
			<form method="get" action="./inquiry_s.jsp">
				<div><br><br>
				<button class="bt" type="submit" style="margin-left:400px;">조회</button><br>
				</div><br>
			</form>
		<section class="bb">
		<%
		ArrayList<InquiryDTO> qshow = new ArrayList<InquiryDTO>();
	  	qshow = new InquiryDAO().quiryShow(userID);
	  	for(int i=0; i<qshow.size(); i++){
	  		InquiryDTO inquiry = qshow.get(i);
		%>
			<br><div class="box1">
				<div><div class="box33">
				답변날짜: <span><%= inquiry.getCommentime() %></span></div></div>
				<div class="box2">
				내용: <span class="box_tx"><%= inquiry.getWrite() %></span>
				</div>
				<div class="box3">
				답변: <span class="box_tx"><%= inquiry.getComment() %></span>
				</div>
			</div>
		<%
	  	}
		%>
		</section>
	</div>
</body>
</html>