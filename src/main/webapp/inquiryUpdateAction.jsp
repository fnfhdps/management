<%--문의사항 답변 데이터 베이스 연동--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="inquiry.InquiryDAO"%>
<%@ page import="inquiry.InquiryDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	int userID = 0;
	int numm = 0;
	String comments = null;

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

	if(session.getAttribute("num") != null){
		try{
			numm = (Integer)session.getAttribute("num");	
			System.out.println("인덱스 값 확인(두번째): "+numm);
		}catch(Exception e){
			System.out.println("인덱스 값이 넘어오지 않음");
		}
	}
	if(request.getParameter("comment") != null){
		try{
			comments = request.getParameter("comment");
			System.out.println("답변 넘어옴");
		}catch(Exception e){
			System.out.println("답변이 넘어오지 않음");
		}
	}
	
	if(numm == 0 || comments == ""){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}else{
		InquiryDAO inquiry = new InquiryDAO();
		int result = inquiry.quiryUpdate(comments, numm);

		if(result == -1){
			PrintWriter script1 = response.getWriter();
			script1.println("<script>");
			script1.println("alert('입력에 실패했습니다.');");
			script1.println("history.back();");
			script1.println("</script>");
			script1.close();
		}
		else{
			PrintWriter printw = response.getWriter();
			printw.println("<script>");
			printw.println("alert('완료');");
			printw.println("location.href='./inquiry_m.jsp;'");
			printw.println("</script>");
			printw.close();
			}
	}
%>