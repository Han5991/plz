<%@page import="com.javamini.StoreDto"%>
<%@page import="com.javamini.StoreDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
    
<jsp:useBean id="dto" class="com.javamini.StoreDto" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
StoreDao dao = StoreDao.getInstance();
int checkNum = dao.insertStore(dto);

if(checkNum == StoreDao.STORE_JOIN_SUCCESS){
%>
<script type="text/javascript">
alert("매장이 추가되었습니다.")
document.location.href="storeList.jsp"
</script>
<%
}else{
%>
<script type="text/javascript">
alert("매장을 추가하는데 실패했습니다.")
history.go(-1);
</script>
<%
}
%>
</body>
</html>