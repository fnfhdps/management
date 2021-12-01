<%--정보 입력&수정--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="information.InformationDTO"%>
<%@ page import="information.InformationDAO"%>
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
		
		<script>
			function submit2(frm){
				frm.action='./infoUpdateAction.jsp';
				frm.submit();
				return true;
			}
		</script>
		
		<section>
			<h3>학생정보</h3>
			<form method="post" action="./infoInsertAction.jsp">
				<div class="info_insert">
					<span>
						<input class="bt" type="submit" value="저장" style="margin-left:760px">
						<input class="bt" type="button" value="수정" onclick='return submit2(this.form);'>
					</span>
					<label for="name"><br><br>이름</label><br>
					<input class="size" type="text" name="name" placeholder="홍길동">
					<label for="major"><br>학과</label><br>
					<input class="size" type="text" name="major" placeholder="항공전자공학과">
					<label for="phone"><br>전화번호</label><br>
					<input class="size" type="tel" name="phone"
						placeholder="010-1234-1234"
					  	pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}">
					<label for="address"><br>주소(지역)</label><br>
					<input class="size" type="text" name="address" placeholder="서울">
					<label for="room"><br>방번호(숫자만)</label><br>
					<select name="room" class="bt">
						<option value="101">101</option>
						<option value="102">102</option>
						<option value="103">103</option>
						<option value="104">104</option>
						<option value="105">105</option>
						<option value="201">201</option>
						<option value="202">202</option>
						<option value="203">203</option>
						<option value="204">204</option>
						<option value="205">205</option>
						<option value="301">301</option>
						<option value="302">302</option>
						<option value="303">303</option>
						<option value="304">304</option>
						<option value="305">305</option>
						<option value="401">401</option>
						<option value="402">402</option>
						<option value="403">403</option>
						<option value="404">404</option>
						<option value="405">405</option>
					</select>
				</div>
			</form><br>
			<table>
				  <tr>
				    <th>이름</th>
				    <th>학과</th>
				    <th>전화번호</th>
				    <th>주소</th>
				    <th>방호수</th>
				  </tr>
				  <%
				  	ArrayList<InformationDTO> show = new ArrayList<InformationDTO>();
					show = new InformationDAO().infoShow(userID);
				  	if(show != null)
				  		for(int i=0; i<show.size();i++){
					  		InformationDTO information = show.get(i);
					   %>
						  <tr>
						  	<td><%= information.getName()%></td>
						  	<td><%= information.getMajor()%></td>
						  	<td><%= information.getPhone()%></td>
						  	<td><%= information.getAddress()%></td>
						  	<td><%= information.getRoom()%></td>
						  </tr>
					  <%
					  		} 
					  %>
			</table>
		</section>	
	</div>
</body>
</html>