<%--회원 가입--%>

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
			<h2><br><br><br>회원가입</h2>
			<form method="post" action="./registerAction.jsp">
				<div>
					<label>아이디</label><br>
					<input type="text" name="userID" placeholder="예)200001234"
					pattern="[0-9]{9}" required>
				</div><br>
				<div>
					<label>비밀번호</label><br>
					<input type="text" name="userPassword">
				</div><br>
				<button type="submit" class="bt">가입</button>
				<input class="bt" type="button" value="취소" onclick="location.href='login.jsp'">
			</form>
		</section>
	</div>
</body>
</html>