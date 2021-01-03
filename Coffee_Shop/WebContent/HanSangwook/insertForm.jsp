<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메뉴 추가 페이지</h2>
	<form action="insertOk" method="post" enctype="multipart/form-data">
		Type : <select name="type">
			<option value="etc" onclick="<%session.setAttribute("type", "blended");%>">blended</option>
			<option value="dessert" onclick="<%session.setAttribute("type", "dessert");%>">dessert</option>
			<option value="etc" onclick="<%session.setAttribute("type", "espresso");%>">espresso</option>
			<option value="etc" onclick="<%session.setAttribute("type", "etc");%>">etc</option>
			<option value="tea" onclick="<%session.setAttribute("type", "tea");%>">tea</option>
			</select>
		<br> Name : <input type="text" name="name"><br>
		price : <input type="text" name="price"><br> image : <input
			type="file" name="image"><br> <input type="submit"
			value="submit">
	</form>
	<a href="../Sooyeon/espresso.jsp">에스프레소 메뉴</a><br>
	<a href="../Sooyeon/blended.jsp">블렌디드 메뉴</a><br>
	<a href="../Sooyeon/tea.jsp">티 메뉴</a><br>
	<a href="../Sooyeon/etc.jsp">기타 메뉴</a><br>
	<a href="../Sooyeon/dessert.jsp">디저트 메뉴</a><br>
</body>
</html>