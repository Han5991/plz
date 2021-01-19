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
				<a class="navbar-brand" href="#" style="font-size: 25px;">Coffee</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="menu.jsp">메뉴 선택</a></li>
					<li><a href="#">장바구니</a></li>
					<li><a href="#">결제 정보</a></li>
					<li><a href="#">영수증 출력</a></li>
					<li><a href="#">결제 완료</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="admin_login.jsp">관리자 로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">메뉴</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#">커피</a></li>
					<li class="active"><a href="#">티</a></li>
					<li><a href="#">음료</a></li>
					<li><a href="#">블렌디드</a></li>
					<li><a href="#">디저트</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<!-- 		<div class="row content" style="background-image: url('../img/menuImg/스벅.png'); background-size: contain;"> -->
		<div class="row content">
			<div class="col-sm-9" align="center">
				<table style="text-align: center;">
					<tbody>
						<tr>
							<td><img src="../img/menuImg/tea_티_얼그레이.jpg" height="200px"
								width="200px"><br>얼그레이<br>4000원</td>
							<td><img src="../img/menuImg/blended_티_캐모마일.jpg" height="200px"
								width="200px"><br>캐모마일<br>4000원</td>
							<td><img src="../img/menuImg/tea_티_히비스커스.jpg" height="200px"
								width="200px"><br>히비스커스<br>5000원</td>
							
						</tr>
						<tr>
							<td><img src="../img/menuImg/tea_티_녹차.jpg" height="200px"
								width="200px"><br>녹차<br>3000원</td>
							<td><img src="../img/menuImg/tea_티_밀크티.jpg" height="200px"
			
								width="200px"><br>밀크티<br>4000원</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="col-sm-3 sidenav">
				
				<h3>Cart</h3>
				<div class="well">
					<p>주문메뉴 리스트</p>
				</div>
				
				<input type="submit" value="결제 하기" class="btn btn-warning"
					style="font-size: 30px;">
			</div>
		</div>
	</div>

</body>
</html>