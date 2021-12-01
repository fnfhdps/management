<%--문의사항 답변--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	int userID = 0;
	int num = 0;
	
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
	
	if(request.getParameter("num") != null){
		try{
			num = Integer.parseInt(request.getParameter("num"));
			System.out.println("인덱스 값 확인(첫번째): "+num);
		}catch(Exception e){
			System.out.println("인덱스 값이 넘어오지 않음");
		}
	}
	
	if(num != 0){
	session.setAttribute("num", num);
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
	<section class="size1">
	</section>
		<br><h3>답변</h3>
		<form method="post" action="./inquiryUpdateAction.jsp">
			<div class="info_insert"><br>
				<input type="text" name="comment" style="height: 150px; width: 280px">
				<br><br><button class="bt" type="submit">저장</button>
				<button class="bt" type="button" onclick="location='inquiry_m.jsp'">취소</button>
			</div>
		</form>
		
</body>
</html>