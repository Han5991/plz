<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding= "utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dto" class="com.javalec.ex.MemberDto" />
	<jsp:setProperty property="*" name="dto" />
	<% 
	MemberDao dao = MemberDao.getInstance();
	if(dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT){
	%>
	<script>
		alert("아이디가 이미 존재합니다.");
		history.go(-1); //뒤로가기
	</script>
	<%
	}else{
		int ri = dao.insertMember(dto); // 회원정보(dto) 디비에 저장시킴
		if(ri == MemberDao.MEMBER_JOIN_SUCCESS){ //1
	%>
	<script>
		alert("회원가입을 축하합니다..");
		document.location.href = "login.html"; //페이지 이동
	</script>
	<%
		}else{
	%>
	<script>
		alert("회원가입에 실패했습니다.");
		document.location.href="join.html";
	</script>
	<%
		}
	}
	%>
</body>
</html>