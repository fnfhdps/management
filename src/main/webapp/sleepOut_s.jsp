<%--외박 입력&조회--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sleepOut.SleepOutDTO"%>
<%@ page import="sleepOut.SleepOutDAO"%>
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
		
		<section class="size1">
			<h3>외박신청</h3>
			<form method="post" action="./sleepOutInsertAction.jsp">
				<div class="info_insert"><br>
					<label for="startDay"><br>시작일</label><br>
					<input class="size" type="date" name="startDay">
					<label for="endDay"><br>종료일</label><br>
					<input class="size" type="date" name="endDay">
					<label for="reason"><br>사유</label><br>
					<input type="text" name="reason" style="height: 150px; width: 280px">
					<br><br><input class="bt" type="submit" value="저장">
				</div>
			</form>
		</section>
		<form method="get" action="./sleepOut_s.jsp">
			<div><br><br>
			<button class="bt" type="submit" style="margin-left:500px;">조회</button><br>
			</div><br><br>
		</form>
		<section class="size2">
			<table>
				  <tr>
				    <th>신청일</th>
				    <th>시작일</th>
				    <th>종료일</th>
				    <th style="width:100px;">사유</th>
				    <th style="width:5px;">승인</th>
				  </tr>
				  	<%
				  	ArrayList<SleepOutDTO> list = new ArrayList<SleepOutDTO>();
				  	list = new SleepOutDAO().outMyList(userID);
				  	for(int i=0; i<list.size();i++){
			  		SleepOutDTO sleepout = list.get(i);
				   	%>
					  <tr>
					  	<td><%= sleepout.getCurrentDay()%></td>
					  	<td><%= sleepout.getStartDay()%></td>
					  	<td><%= sleepout.getEndDay()%></td>
					  	<td style="width:100px;"><%= sleepout.getReason()%></td>
					  	<td style="width:5px;"><%= sleepout.getOk()%></td>
					  </tr>
				  	<%
				  		} 
					%>
			</table>
		</section>
	</div>
</body>
</html>