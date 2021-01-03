<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		MemberDao dao = MemberDao.getInstance();
		int checkNum = dao.userCheck(id, pwd);

		if (checkNum == -1) { // login_is_not(회원이 아니다.id도 없음)
	%>
	<script type="text/javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1); //뒤로 가기
	</script>

	<%
		} else if (checkNum == 0) { //login_pw_no_good(비밀번호 틀림)
	%>

	<script>
		alert("잘못된 비밀번호입니다.");
		history.go(-1);
	</script>

	<%
		} else if (checkNum == 1) { //로그인 성공 시 
			MemberDto dto = dao.getMember(id); //getMember를 호출해서 id값을 가져와 dto에 저장
			if (dto == null) { //값이 null이면
	%>

	<script type="text/javascript">
		alert("존재하지 않는 아이디입니다.");
		history.go(-1);
	</script>

	<%
			} else { //값이 null이 아니면(회원일 경우)
				String name = dto.getName();
				//로그인 정보 세션에 저장(다른페이지로 넘겨야되서)
				session.setAttribute("dto", dto);
				session.setAttribute("id", id);
				session.setAttribute("name", name);
				session.setAttribute("ValidMem", "yes");

				response.sendRedirect("main.jsp"); //서버가 클라이언트쪽으로 재요청함.

			}
		}
	%>
</body>
</html>

















