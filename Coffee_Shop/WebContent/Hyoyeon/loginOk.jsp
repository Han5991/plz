<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDao dao = MemberDao.getInstance();
		int checkNum = dao.userCheck(id, pw);

		if (checkNum == -1) { // login_is_not
	%>

	<script type="text/javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>

	<%
		} else if (checkNum == 0) { //login_pw_no_good
	%>

	<script>
		alert("잘못된 비밀번호입니다.");
		history.go(-1);
	</script>

	<%
		} else if (checkNum == 1) {
			MemberDto dto = dao.getMember(id); //getMember를 호출해서 id값을 가져옴
			if (dto == null) { //값이 null이면
	%>

	<script type="text/javascript">
		alert("존재하지 않는 아이디입니다.");
		history.go(-1);
	</script>

	<%
		} else { //값이 null이 아니면(회원일 경우)
				String name = dto.getName();
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("ValidMem", "yes");
				response.sendRedirect("main.jsp");

			}
		}
	%>
 --%></body>
</html>

















