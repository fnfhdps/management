<%--외박 조회&승인--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sleepOut.SleepOutDAO"%>
<%@ page import="sleepOut.SleepOutDTO"%>
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
	
	
	int numID = 0;
	String ok = null;

	if(request.getParameter("numID") != null){
		numID = Integer.parseInt(request.getParameter("numID"));
	}
	
	if(request.getParameter("ok") != null){
		ok = request.getParameter("ok");
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기숙사 관리 홈페이지</title>
	<link rel="stylesheet" href="./main.css">
	<script>
		function acceptY(num){
			location.href = "./sleepOutUpdateAction.jsp?ok=Y&numID="+num;
			//http://localhost:8080/hello_world/SleepOutDAO?
		}
		function acceptN(num){

			location.href = "./sleepOutUpdateAction.jsp?ok=N&numID="+num;
			//http://localhost:8080/hello_world/SleepOutDAO?
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
		<h3>외박관리</h3>
		<br><br><section><br>
				<table>
					  <tr>
					  	<th style="width:20px;">번호</th>
					    <th>신청일</th>
					    <th>학번</th>
					    <th>시작일</th>
					    <th>종료일</th>
					    <th style="width:100px;">사유</th>
					    <th style="width:5px;">승인</th>
					    <th style="width:50px;"></th>
					  </tr>
					  <%
					  	ArrayList<SleepOutDTO> list = new ArrayList<SleepOutDTO>();
					  	list = new SleepOutDAO().outAllList();
					  	
						for(int i=list.size()-1; i>=0;i--){
				  		SleepOutDTO sleepout = list.get(i);
					   	%>
						  <tr>
						  	<td style="width:20px;"><%= sleepout.getNumID()%></td>
						  	<td><%= sleepout.getCurrentDay()%></td>
						  	<td><%= sleepout.getUserID()%></td>
						  	<td><%= sleepout.getStartDay()%></td>
						  	<td><%= sleepout.getEndDay()%></td>
						  	<td style="width:100px;"><%= sleepout.getReason()%></td>
						  	<td style="width:5px;"><%= sleepout.getOk() %></td>
						  	<td style="width:50px;">
						  		<button type="button" onclick="acceptY('<%= sleepout.getNumID()%>');">
						  		 허가</button>
						  		<button type="button" onclick="acceptN('<%= sleepout.getNumID()%>');">
						  		 거절</button>
						  	</td>	
						  </tr>
					  	<%
					  		} 
						%>
				</table>
		</section>
	</div>
</body>
</html>