<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
		alert("���̵� �̹� �����մϴ�.");
		history.go(-1); //�ڷΰ���
	</script>
	<%
	}else{
		int ri = dao.insertMember(dto); // ȸ������(dto) ��� �����Ŵ
		if(ri == MemberDao.MEMBER_JOIN_SUCCESS){ //1
	%>
	<script>
		alert("ȸ�������� �����մϴ�..");
		document.location.href = "login.jsp"; //������ �̵�
	</script>
	<%
		}else{
	%>
	<script>
		alert("ȸ�����Կ� �����߽��ϴ�.");
		document.location.href="join.html";
	</script>
	<%
		}
	}
	%>
</body>
</html>