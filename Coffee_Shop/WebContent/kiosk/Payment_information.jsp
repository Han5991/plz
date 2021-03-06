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
		<div class="row content">
			<div class="col-sm-9" align="center">
				<table style="text-align: center;">
					<thead>
						<tr>
							<th>주문제품</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><img src="../img/menuImg/스벅.png" height="150px"
								width="150px"></td>
							<td>1</td>
							<td>5000원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/스벅.png" height="150px"
								width="150px"></td>
							<td>1</td>
							<td>5000원</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td>주문 금액</td>
							<td>5000원</td>
						</tr>
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
				<input type="reset" value="  주문 다시 하기  " class="btn btn-warning"
					style="font-size: 30px;"><br>
				<br>
				<input type="submit" value="결제 및 주문완료" class="btn btn-warning"
					style="font-size: 30px;">
			</div>
		</div>
	</div>

</body>
</html>