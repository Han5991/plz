<%@page import="com.javalec.ex.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="logout.jsp" method="post">
<%
// 	MemberDto dto = (MemberDto)session.getAttribute("dto");
	String name = (String)session.getAttribute("name");
%>
	<h3><%=name%>님, 안녕하세요!</h3>

		<input type="button" class="btn btn-secondary" onclick="javascript:window.location='logout.jsp'" value="로그아웃" >&nbsp;&nbsp;&nbsp;
		<input type="button" class="btn btn-secondary" onclick="javascript:window.location='modify.jsp'" value="정보수정">
	</form>
</body>
</html>