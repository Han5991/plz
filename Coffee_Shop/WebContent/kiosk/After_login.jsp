<%@page import="adminLogin.adminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw= request.getParameter("pw");
	
	adminDao dao= adminDao.getInstance();
	int check = dao.adminCheck(id, pw);
	
	if(check ==-1 ){ //
%>


<% 
	}
%>





</body>
</html>