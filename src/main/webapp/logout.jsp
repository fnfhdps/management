<%--로그아웃 섹션 해제--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
%>
<script>
	location.href = 'login.jsp';
</script>