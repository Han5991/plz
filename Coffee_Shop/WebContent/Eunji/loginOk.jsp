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
// 			out.print(m.getUserid() + "님 반갑습니다!");
			// 로그인 성공 시 성공창 띄우고 login이 완료된 메인페이지로 이동하기.
			out.print("<script>alert('"+m.getUserid()+"님 반갑습니다!'); location.href='login_success.jsp';</script>");
		} else {
			// 로그인 불가 시 창띄우고 뒤로가기
			out.print("<script>alert('회원 정보가 존재하지 않습니다.'); history.back();</script>");
		}
		%>
</body>
</html>