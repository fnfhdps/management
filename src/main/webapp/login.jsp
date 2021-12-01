<%--로그인--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<section class="back_c">
			<h2><br><br><br>로그인</h2>
			<form method="post" action="./loginAction.jsp">
				<div>
					<label>아이디</label><br>
					<input type="text" name="userID">
				</div><br>
				<div>
					<label>비밀번호</label><br>
					<input type="password" name="userPassword">
				</div><br>
				<button class="bt" type="submit">로그인</button>
				<input class="bt" type="button" value="회원가입" onclick="location.href='join.jsp'">
			</form>
		</section>
	</div>
</body>
</html>