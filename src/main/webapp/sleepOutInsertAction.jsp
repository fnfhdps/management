<%--외박 입력 데이터 베이스 연동--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sleepOut.SleepOutDAO"%>
<%@ page import="sleepOut.SleepOutDTO"%>
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

	String startDay = null;
	String endDay = null;
	String reason = null;

	if(request.getParameter("startDay") != null){
		startDay = request.getParameter("startDay");
	}
	if(request.getParameter("endDay") != null){
		endDay = request.getParameter("endDay");
	}
	if(request.getParameter("reason") != null){
		reason = request.getParameter("reason");
	}

	if(startDay == null || endDay == null || reason == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}
	
	SleepOutDAO sleepOutDAO = new SleepOutDAO();
	int result = sleepOutDAO.outInsert(new SleepOutDTO(0, null, userID, startDay, endDay, reason, null));
	//입력값 받고 outInsert로 넘어가서 현재 날짜 받는거임
	
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
%>