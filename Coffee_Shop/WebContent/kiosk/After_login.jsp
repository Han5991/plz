
<%@page import="adminLogin.adminDao"%>
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
		String pw = request.getParameter("pw");

		adminDao dao = adminDao.getInstance();
		int checkNum = dao.adminCheck(id, pw);

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
		} else if (checkNum == 2) { //admin 로그인 성공 시
			response.sendRedirect("admin_menuinsert.jsp"); //관리자 페이지로 이동

	%>
	<script>
		alert("관리자 페이지로 이동합니다.");
	</script>
	<%
		} else if (checkNum == -1) { //로그인 성공 시 
// 			adminDao dto = dao.getMember(id); //getMember를 호출해서 id값을 가져와 dto에 저장
			if (id =! dao.adm) { //값이 null이면
	%>
	<script type="text/javascript">
		alert("존재하지 않는 아이디입니다.");
		history.go(-1);
	</script>
	<%
// 		} else { //값이 null이 아니면(회원일 경우)
// 				String name = dto.getName();
// 				//로그인 정보 세션에 저장(다른페이지로 넘겨야되서)
// 				session.setAttribute("user", dto);
// 				session.setAttribute("ValidMem", "yes");
// 				System.out.println(dto.getId() + "접속");
// 				//정보수정을 테스트위해 main.jsp이동 살려둠
// 				//response.sendRedirect("main.jsp");

// 				//매장찾기페이지로 이동
// 				response.sendRedirect("../CoffeeShop_Store/address.jsp"); //서버가 클라이언트쪽으로 재요청함.
			}
		}
	%>
</body>
</html>