<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Calendar calendar = Calendar.getInstance();
int h = calendar.get(Calendar.HOUR_OF_DAY);
int m = calendar.get(Calendar.MINUTE);
int s = calendar.get(Calendar.SECOND);
%>
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

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background-color: #D9CDBC;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 1119px;
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

table {
	font-size: x-large;
}
td{
padding-right: 20px;
}
img {
	margin: 30px 100px 30px 0px;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Projects</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<!-- 		<div class="row content" style="background-image: url('../img/menuImg/스벅.png'); background-size: contain;"> -->
		<div class="row content text-center">
			<div class="col-sm-9" align="center">
				<h1>주문 관리 페이지</h1>
				<hr>
				<table style="text-align: center;">
					<thead>
						<tr>
							<td>주문 번호</td>
							<td>키오스크 아이디</td>
							<td>주문시각</td>
							<td>주문금액</td>
							<td>주문목록</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>test1</td>
							<td><%=h%>시<%=m%>분<%=s%>초</td>
							<td>5000원</td>
							<td></td>
						</tr>
					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>
			<div class="col-sm-3 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
				<input type="reset" value="주문 취소" class="btn btn-warning"
					style="font-size: 30px;"><br> <br> <input
					type="submit" value="조리 시작" class="btn btn-warning"
					style="font-size: 30px;">
			</div>
		</div>
	</div>

</body>
</html>