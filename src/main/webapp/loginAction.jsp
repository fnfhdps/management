<%--로그인 데이터 베이스 연동--%>

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
				System.out.println("데이터 연동 오류");
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
		int result = userDAO.login(userID, userPassword);
		
		if(result == 1){
			session.setAttribute("userID", userID);		
			if(userID == 2021 || userPassword == "manager2021"){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index_m.jsp';");
				script.println("</script>");
				script.close();
			}
			else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='index_s.jsp';");
				script.println("</script>");
				script.close();
			}
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀렸습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			}
	}
%>
 