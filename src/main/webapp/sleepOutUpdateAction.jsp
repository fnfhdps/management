<%--외박 승인 데이터 베이스 연동--%>

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
	
	int numID = 0;
	String ok = null;

	if(request.getParameter("numID") != null){
		numID = Integer.parseInt(request.getParameter("numID"));
		System.out.println("외출 인덱스 값 확인: "+numID);
	}
	
	if(request.getParameter("ok") != null){
		ok = request.getParameter("ok");
		System.out.println("외출 승인 값 확인: "+ok);
	}
	if(numID == 0 || ok == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}else{
		SleepOutDAO sleepOutDAO = new SleepOutDAO();
		int result = sleepOutDAO.outUpdate(ok, numID);
		
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
			script.println("location.href='sleepOut_m.jsp';");
			script.println("</script>");
			script.close();
			}
	}
%>