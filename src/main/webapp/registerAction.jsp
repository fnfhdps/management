<%--회원가입 데이터 베이스 연동--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	int userID = 0;
	String userPassword = null;
	if(request.getParameter("userID") != null){
			try{
				userID = Integer.parseInt(request.getParameter("userID"));
			}catch(Exception e){
				System.out.println("강의 연동 데이터 오류");
			}
	}
	if(request.getParameter("userPassword") != null){
			userPassword = request.getParameter("userPassword");
	}
	if(userID == 0 || userPassword == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, userPassword));
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입에 성공했습니다.');");
			script.println("location.href='login.jsp';");
			script.println("</script>");
			script.close();
			}
	}
%>