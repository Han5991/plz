<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 
%>
    <jsp:useBean id="dto" class="com.javalec.ex.MemberDto" scope="page"></jsp:useBean> 
    <jsp:setProperty name="dto" property="*"/> 
    
<%	
	String id=(String)session.getAttribute("id"); 
	MemberDao dao = MemberDao.getInstance();
	
	int ri= dao.updateMember(dto);  
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOk.jsp</title>
</head>
<body>


<script type="text/javascript">

	alert("수정 완료 되었습니다 ");	
	document.location.href="main.jsp" ;
</script>

<script type="text/javascript">
	alert("정보 수정 실패하였습니다.");
	history.go(-1);  //수정실패하면 전페이지에서 다시 실행

	
</script>	



</body>
</html>









