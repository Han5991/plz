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
//String id = (String)session.getAttribute("id");
String storeId = request.getParameter("storeId");
StoreDao dao = StoreDao.getInstance();
dto.setStoreId(storeId);
/* StoreDto dto = dao.getStore(storeId);
dto.setStoreName(request.getParameter("storeName"));
dto.setStoreAddress(request.getParameter("storeAddress"));
dto.setStorePhone(request.getParameter("storePhone")); */
int checkNum = dao.updateStore(dto);

if(checkNum==1){
%>
<script type="text/javascript">
alert("매장 정보가 수정 되었습니다.")
document.location.href="storeList.jsp"
</script>
<%
}else{
%>
<script type="text/javascript">
alert("매장 정보 수정에 실패했습니다.")
history.go(-1);
</script>
<%
}
%>
</body>
</html>