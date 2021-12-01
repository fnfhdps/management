<%--정보 수정 데이터 베이스 연동--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="information.InformationDTO"%>
<%@ page import="information.InformationDAO"%>
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
	
	String major = null;
	String name = null;
	String phone = null;
	String address = null;
	int room = 0;

	if(request.getParameter("name") != null){
		name = request.getParameter("name");
	}
	if(request.getParameter("major") != null){
		major = request.getParameter("major");
	}
	if(request.getParameter("phone") != null){
		phone = request.getParameter("phone");
	}
	if(request.getParameter("address") != null){
		address = request.getParameter("address");
	}
	if(request.getParameter("room") != null){
		try{
			room = Integer.parseInt(request.getParameter("room"));
		}catch(Exception e){
			System.out.println("잘못 입력했습니다.");
		}
	}
	
	if(major == "" || name == "" || phone == "" || address == "" || room == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	}else{
		InformationDAO information = new InformationDAO();
		int result = information.infoUpdate(name, major, phone, address, room, userID);
		
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력에 실패했습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('완료');");
			script.println("location.href='information_s.jsp';");
			script.println("</script>");
			script.close();
			}
	}
%>