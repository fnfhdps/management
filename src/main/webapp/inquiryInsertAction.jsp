<%--문의사항 입력 데이터 베이스 연동--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="inquiry.InquiryDAO"%>
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
	
	String write = null;
	
	if(request.getParameter("write") != null){
		write = (String)request.getParameter("write");
	}
	
	if(write == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}else{
		InquiryDAO inquiry = new InquiryDAO();
		int result = inquiry.quiryInsert(userID, write);
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력에 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('완료');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			}
	}
%>