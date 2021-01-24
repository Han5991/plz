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

.popup {position:absolute; left:50%; top:50%; z-index:5; translate(-50%, -50%); 
width: 500px; height: 500px; box-shadow: 0 0 10px rgba(0,0,0,0.5); background:#fff;
border-radius: 5px; text-align: right; padding: 20px; box-sizing: border-box; opacity: 0;
transition: all 0.5s;}
.popup a {color:grey; text-decoration: none;}
.popup:target {opacity: 1;}
.popup:target + dim {opacity: 1; z-index: :2;}
.dim {position: fixed; left: 0; top:0; z-index:-1; width: 100%; height: 100%;
background: rgba(0,0,0,0.6); opacity: 0; transition: all 0.5s;}
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
					<li><a href="#">티</a></li>
					<li><a href="#">음료</a></li>
					<li class="active"><a href="#">블렌디드</a></li>
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
							<td><a href="#pop1" class="btn" ><img src="../img/menuImg/blended_그린티블렌.jpg" 
							height="200px"width="200px"><br>그린티 블렌디드<br>5500원</a></td>
								<div class="popup" id="pop1">
								
									<a href="#">닫기</a>	
								</div>
								<div class="dim"></div>
							<td><img src="../img/menuImg/blended_모카블렌.jpg" height="200px"
								width="200px"><br>모카 블렌디드<br>5000원</td>
							<td><img src="../img/menuImg/blended_바닐라블렌.jpg" height="200px"
								width="200px"><br>바닐라 블렌디드<br>5000원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/blended_초코칩블렌.jpg" height="200px"
								width="200px"><br>초코칩 블렌디드<br>4000원</td>
							<td><img src="../img/menuImg/blended_카페모카.jpg" height="200px"
								width="200px"><br>카페모카<br>3500원</td>
							<td><img src="../img/menuImg/blended_카푸치노.jpg" height="200px"
								width="200px"><br>카푸치노<br>3500원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/blended_화초모블렌.jpg" height="200px"
								width="200px"><br>화이트초코모카 블렌디드<br>6000원</td>
							<td><img src="../img/menuImg/blended_화초블렌.jpg" height="200px"
								width="200px"><br>화이트초코 블렌디드<br>5500원</td>
							<td><img src="../img/menuImg/blended_흑임자블렌.jpg" height="200px"
								width="200px"><br>흑임자 블렌디드<br>6500원</td>
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