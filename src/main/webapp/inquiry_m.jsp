<%--문의사항 조회--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="inquiry.InquiryDAO"%>
<%@ page import="inquiry.InquiryDTO2"%>
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
	
	
	int Num = 0;
	String ok = null;

	if(request.getParameter("Num") != null){
		Num = Integer.parseInt(request.getParameter("Num"));
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기숙사 관리 홈페이지</title>
	<link rel="stylesheet" href="./main.css">
	<script>
		function answer(Num){
			location.href = "./inquiry_m2.jsp?num="+Num;
		}
	</script>
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
		<h3>문의사항</h3>
		<br><br><section><br>
				<table>
					  <tr>
					  	<th style="width:20px;">번호</th>
					    <th>등록일</th>
					    <th>학생이름</th>
					    <th style="width:30px;">방번호</th>
					    <th style="width:160px;">내용</th>
					    <th style="width:120px;">답변</th>
					    <th style="width:15px;"></th>
					  </tr>
					  <%
					  	ArrayList<InquiryDTO2> qshow = new ArrayList<InquiryDTO2>();
					  	qshow = new InquiryDAO().quiryShow();
					  	
						for(int i=qshow.size()-1; i>=0;i--){
							InquiryDTO2 inquiry = qshow.get(i);
					   	%>
						  <tr>
						  	<td style="width:20px;"><%= inquiry.getNum()%></td>
						  	<td><%= inquiry.getCurrentDay()%></td>
						  	<td><%= inquiry.getName()%></td>
						  	<td style="width:30px;"><%= inquiry.getRoom()%></td>
						  	<td style="width:160px;"><%= inquiry.getWrite()%></td>
						  	<td style="width:120px;"><%= inquiry.getComment()%></td>
						  	<td style="width:15px;">
						  	<button type="button" onclick="answer('<%= inquiry.getNum()%>');">
						  	답변</button>
						  </tr>
					  	<%
					  		} 
						%>
				</table>
		</section>
	</div>
</body>
</html>