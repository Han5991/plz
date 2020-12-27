<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.btnTab {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	height: 70px;
	font-size: 20px;
	background-color: #D9CDBC;
	font-color: gray;
}

a:hover:not(.active) {
	color: white;
}

.menuProduct {
	list-style: none;
	margin: 10px; /* 이미지 위쪽 */
	padding: 50px;
}

.list {
	margin: 10px;
	padding: 0;
	border: 0;
	float: left;
}

/* tabCont01 {
float:center;
} */
</style>

<title>메뉴 | Autumn Leaves</title>
</head>
<body style="background: white">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Autumn Leaves</a>
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

	<div id="container">
		<!-- <div id="contents"> -->
		<div id="section">
			<!-- 내용 -->
			<div class="tabArea navbar- menus">
				<div class="btnTab text-center">
					<a href="#" class="active"><span class="all">전체</span></a> <a
						href="espresso.jsp"><span class="chi06">에스프레소</span></a> <a
						href="blended.jsp"><span class="chi08">블렌디드 </span></a> <a
						href="tea.jsp"><span class="chi01">티</span></a> <a href="etc.jsp"><span
						class="chi03">기타 음료</span></a> <a href="dessert.jsp"><span
						class="chi02">디저트</span></a>
				</div>
			</div>
		</div>
	</div>


	<div id="tabCont01" class="tabConts">
		<ul class="menuProduct">
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/에스프레소.jpg" alt="에스프레소" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>에스프레소</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/아메리카노.jpg" alt="아메리카노" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>아메리카노</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/카푸치노.jpg" alt="카푸치노" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>아메리카노</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/카페모카.jpg" alt="카페모카" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>아메리카노</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/카라멜 마키아토.jpg" alt="카라멜 마키아토" width="250"
						height="250" />
				</p>
				<dl class="text-center">
					<dt>아메리카노</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/화초모_아이스.jpg" alt="화초모_아이스" width="250"
						height="250" />
				</p>
				<dl class="text-center">
					<dt>아메리카노</dt>
				</dl>
			</li>
		</ul>
	</div>

</body>
</html>