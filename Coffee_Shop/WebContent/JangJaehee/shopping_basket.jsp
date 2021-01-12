<%@page import="Coffee_Shop.menu.MenuDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name[] = request.getParameterValues("name");
String price[] = request.getParameterValues("price");
String quantity[] = request.getParameterValues("quantity");
MenuDto dto = null;
ArrayList<MenuDto> Menudtos = (ArrayList) session.getAttribute("orderList");
if (Menudtos == null) {
	Menudtos = new ArrayList<MenuDto>();
	for (int a = 0; a < name.length; a++)
		if (!quantity[a].equals("0"))
	Menudtos.add(new MenuDto(name[a], Integer.parseInt(price[a]), Integer.parseInt(quantity[a])));
} else {
	for (int a = 0; a < name.length; a++)
		if (!quantity[a].equals("0"))
	Menudtos.add(new MenuDto(name[a], Integer.parseInt(price[a]), Integer.parseInt(quantity[a])));
}
session.setAttribute("orderList", Menudtos);
int sum = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
@font-face {
	font-family: hzStyleFont;
	src: url("../font/Cafe24Ssurround.ttf");
}

* {
	font-family: hzStyleFont;
}

.navbar {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background-color: #D9CDBC;
}

.jumbotron {
	margin-bottom: 20px;
	background-color: white;
}

.recent account {
	background-color: gray;
}

.table {
	text-align: left;
	font-size: 20px;
}
</style>
<title>장바구니</title>
</head>
<body style="background: lightgray">
	<form action="../HanSangwook/Payment_information.jsp">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">장바구니</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="#">About</a></li>
						<li><a href="#">Gallery</a></li>
						<li><a href="#">Contact</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
								Login</a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div class="jumbotron">
			<div class="text-center">최근 주문내역 보기</div>
		</div>

		<div class="jumbotron">
			<div class="container">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<th><input type="checkbox" name="whole" value="whole">전체
								선택</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td>메뉴</td>
							<td>가격</td>
							<td>수량</td>
						</tr>
						<%
							for (int b = 0; b < Menudtos.size(); b++) {
							dto = Menudtos.get(b);
						%>
						<tr>
							<td><img src="../showImage?key1=<%=dto.getName()%>"
								width="250" height="250" /></td>
							<td><%=dto.getName()%></td>
							<td><%=dto.getPrice()%></td>
							<td><%=dto.getQuantity()%></td>
						</tr>
						<%
							sum += dto.getPrice() * dto.getQuantity();
						}
						%>
					</tbody>
				</table>
			</div>
		</div>

		<div class="jumbotron" style="margin-bottom: 0px">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td>총 합계금액<%=sum%> 원
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="button" value="메뉴 추가하기"
								class="btn btn-warning"
								onclick="history.back()"><input
								type="submit" value="주문하기" class="btn btn-warning"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>