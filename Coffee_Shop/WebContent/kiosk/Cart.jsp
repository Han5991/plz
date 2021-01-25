<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
@font-face {
	font-family: hzStyleFont;
	src: url("../font/ImcreSoojin.ttf");
}

* {
	font-family: hzStyleFont;
}

img {
	height: 150px;
	width: 150px;
}

span {
	height: 96.3%;
	position: fixed;
	left: 85%;
	width: 15%;
	text-align: center;
	background: lightgray;
}

table {
	margin: 50px auto;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<%@ include file="navbar_user.jsp"%>
	<span> 총 합계 금액 : <br>8500원 <br> <br> <input
		type="reset" value="메뉴 추가하기" class="btn btn-warning"
		style="font-size: 30px;"><br> <br> <input
		type="submit" value="주문 하기" class="btn btn-warning"
		style="font-size: 30px;"></span>
	<table>
		<tr>
			<td>메뉴</td>
			<td>상품명</td>
			<td>수량</td>
			<td>가격</td>
		</tr>
		<%
			for (int i = 0; i < 5; i++) {
		%>
		<tr>
			<td><img src="../img/menuImg/blended_흑임자블렌.jpg" /></td>
			<td>흑임자블렌</td>
			<td>1</td>
			<td>5000원</td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>