<%--정보 검색--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="information.InformationDAO"%>
<%@ page import="information.InformationDTO"%>
<%@ page import="java.net.URLEncoder"%>
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
	
	
	String search = "";

	if(request.getParameter("search") != null){
		search = request.getParameter("search");
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
				<li><a href="information_m.jsp">학생정보</a></li>
				<li><a href="sleepOut_m.jsp">외박관리</a></li>
				<li><a href="inquiry_m.jsp">문의사항</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul>
		</nav>
		<h3>학생정보</h3>
			<section>
				<form method="post" action="./information_m.jsp">
					<input class="bt2" type="text" name=search
					style="width: 150px; height: 30px; margin-left:750px;">
					<button class="bt" type="submit">검색</button>
				</form>
				
				<br><table>
					<tr>
					  	<th>학번</th>
					    <th>학과</th>
					    <th>이름</th>
					    <th>전화번호</th>
					    <th>주소</th>
					    <th>방번호</th>
					  </tr>
					  <%
					  	ArrayList<InformationDTO> insearch = new ArrayList<InformationDTO>();
					  	insearch = new InformationDAO().getSearch(search);
					  	if(insearch != null)
							for(int i=0; i<insearch.size();i++){
				  				InformationDTO info = insearch.get(i);
					   	%>
						  <tr>
						  	<td><%= info.getUserID()%></td>
						  	<td><%= info.getMajor()%></td>
						  	<td><%= info.getName()%></td>
						  	<td><%= info.getPhone()%></td>
						  	<td><%= info.getAddress()%></td>
						  	<td><%= info.getRoom()%></td>
						  </tr>
					  	<%
					  		}
						%>
				</table>
		</section>
	</div>
</body>
</html>