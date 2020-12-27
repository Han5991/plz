<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="javabeans.MemberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = request.getParameter("user_id");
		String pwd = request.getParameter("pwd");
		MemberBean m = new MemberBean(); //데이터를 저장할 목적인 MemberBean객체 생성_해당 클래스 import로 불러오기
		m.setUserid("eunji");
		m.setPwd("1234");
		if (user_id.equals(m.getUserid()) && pwd.equals(m.getPwd())) {
			out.print(m.getUserid() + "님 반갑습니다!");
		} else {
			%>alert("회원정보가 존재하지 않습니다.");<% 
		}
		%>
</body>
</html>