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
<script type="text/javascript">
	$(document).ready(function() {

		$(".open").on('click', function() {
			$(".popup").show();
			$(".dim").show();

		});
	});
</script>
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

.popup {
	display: none;
	position : fixed;
	left: 50%;
	top: 50%;
	z-index: 100;
	padding: 52px 60px 60px;
	width: 720px;
	height: 733px;
	transform: translate(-50%, -50%);
	box-sizing: border-box;
	background: #fff;
	position: fixed;

	/* box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
	
	border-radius: 5px;
	text-align: right;
	opacity: 0;
	transition: all 0.5s; */
}

.popup h2 {
	padding: 0 0 42px;
	border-bottom: 3px solid #444;
	font-weight: normal;
	font-size: 36px;
	color: #222;
	text-align: center;
	line-height: 100%;
	color: #222;
}

.popup close {
	position: absolute;
	right: 40;
	top: 40;
	width: 41px;
	height: 41px;
	background: url(./../img/btn-close.png) no-repeat;
	color: transparent;
}

.popup .con {
	padding: 40 78px;
	border-bottom: 1px solid #e8e8e8;
}

.dim {
display:none;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 99;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	opacity: 0;
	transition: all 0.5s;
}

table.option {
	border-bottom: 1px solid #e8e8e8;
}

table.option th, table.option td {
	padding: 0 0 20px;
}

table.option th {
	padding-top: 15px;
	vertical-align: top;
	font-size: 14px;
	color: #222;
	text-align: center;
	font-weight: nermal;
	font-size: 14px;
}

table.option textarea {
	height: 116px;
}

input[type="radio"] {
	position: absolute;
	left: -3000%;
}

input[type="radio"]+label {
	font-size: 14px;
	color: #666;
}

input[type="radio"]+label:before {
	content: "";
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 1px solid #ddd;
	margin: 0 10px 0 0;
	background: #f4f4f4;
	vertical-align: middle;
	box-sizing: border-box;
	transition: all 0.3s;
}

input[type="radio"]:checked+label:before {
	border: :7px solid #666;
}

.txt_center {
	text-align: center;
	padding: 30px 0 0;
}

.btn_choice {
	display: inline-block;
	width: 170px;
	height: 50px;
	background: #de4f41;
	line-height: 50px;
	color: #fff;
	text-align: center;
	border-radius: 3px;
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
							<td><a href="#" class="open"><img
									src="../img/menuImg/blended_그린티블렌.jpg" height="200px"
									width="200px"><br>그린티 블렌디드<br>5500원</a></td>
							<div class="popup">
								<h2>옵션 선택</h2>
								<div class="con">
									<table class="option">
										<caption>
											<details class="hide">
												<summary>옵션선택 폼</summary>
												<div>메뉴이름, 이미지, 수량, 타입을 확인 또는 선택하는 표</div>
											</details>
										</caption>
										<colgroup>
											<col style="width: 111px">
											<col>
										</colgroup>
										<tbody>
											<tr>
												<th><label for="list1">메뉴이름</label></th>
												<td id="list1">상세설명</td>
											</tr>
											<tr>
												<th><label for="list2"> <img id="list2"
														src="../img/menuImg/blended_그린티블렌.jpg" height="200px"
														width="200px" text-align="center;"><br>그린티 블렌디드<br>5500원
												</label></th>
												<td><textarea></textarea></td>
											</tr>
											<tr>
												<th><label for="list3">수량</label></th>
												<td><input type="button" id="list3_1" value="-"
													name="minus"> <input type="text" id="list3_2"
													value="0" name="quantity" style="text-align: center;"
													readonly="readonly"> <input type="button" value="+"
													name="plus"></td>
											</tr>
											<tr>
												<th><label for="list4">타입</label></th>
												<td><input type="radio" id="list4_1" value="HOT"
													name="HOT"> <input type="radio" id="list4_2"
													value="ICE" name="ICE"></td>
											</tr>
										</tbody>
									</table>
									</div>
								<div class="txt_center">
									<a href="#" class="btn_choice">선택 완료</a>
								</div>
								<a href="#" class="close">닫기</a>
							</div>
							-----------------------------------------------------------------
							<div class="dim"></div>
							<td><img src="../img/menuImg/blended_모카블렌.jpg"
								height="200px" width="200px"><br>모카 블렌디드<br>5000원</td>
							<td><img src="../img/menuImg/blended_바닐라블렌.jpg"
								height="200px" width="200px"><br>바닐라 블렌디드<br>5000원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/blended_초코칩블렌.jpg"
								height="200px" width="200px"><br>초코칩 블렌디드<br>4000원</td>
							<td><img src="../img/menuImg/blended_카페모카.jpg"
								height="200px" width="200px"><br>카페모카<br>3500원</td>
							<td><img src="../img/menuImg/blended_카푸치노.jpg"
								height="200px" width="200px"><br>카푸치노<br>3500원</td>
						</tr>
						<tr>
							<td><img src="../img/menuImg/blended_화초모블렌.jpg"
								height="200px" width="200px"><br>화이트초코모카 블렌디드<br>6000원</td>
							<td><img src="../img/menuImg/blended_화초블렌.jpg"
								height="200px" width="200px"><br>화이트초코 블렌디드<br>5500원</td>
							<td><img src="../img/menuImg/blended_흑임자블렌.jpg"
								height="200px" width="200px"><br>흑임자 블렌디드<br>6500원</td>
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