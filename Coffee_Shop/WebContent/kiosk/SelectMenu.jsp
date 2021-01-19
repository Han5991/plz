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
	text-align: center;
	vertical-align: middle;
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

#form {
	width: 330px;
	height: 200px;
	border: 3px solid lightgray;
	border-radius: 20px;
	margin: 80px auto;
}

#id {
	margin: 20px 80px;
}

#pw {
	margin: 0px 80px;
}

#btn {
	margin: 20px 0;
	margin-left: 120px;
}
/* img.detail {
position:absolute; */
/*  right: 700px;
top:50px;*/
}
/* .optionImg {
   border-radius: 30% */
   
   //버튼디자인
/* a.animated-button.victoria-four {
	border: 2px solid #D24D57;
}
a.animated-button.victoria-four:after {
	background: #D24D57;
	opacity: .5;
	-moz-transform: translateY(-50%) translateX(-50%) rotate(90deg);
	-ms-transform: translateY(-50%) translateX(-50%) rotate(90deg);
	-webkit-transform: translateY(-50%) translateX(-50%) rotate(90deg);
	transform: translateY(-50%) translateX(-50%) rotate(90deg);
}
a.animated-button.victoria-four:hover:after {
	opacity: 1;
	height: 600% !important;
} */
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
		<div id="option" class="option">
			<h1>옵션 선택</h1>
			<hr>
			<form action="*">
				<ul class="*">
					<li class="menuInfo">
						<p>메뉴이름</p>
						<div class="optionImg">
							<img class="detail" alt="*" src="../img/menuImg/blended_그린티블렌.jpg" width="150"
								height="150">
						<p>보성 녹차의 씁쓸함과 1등급 원유의 부드러움을 느껴보세요.</p> <!-- <hr> --> <br>
						</div>
						<p>
							<input type="button" value="-" name="minus"> <input
								type="text" value="0" name="quantity"
								style="text-align: center;" readonly="readonly"> <input
								type="button" value="+" name="plus">
						</p>
						<br>
					<!-- 버튼 디자인	 <div class="col-md-3 col-sm-3 col-xs-6"> <a href="#" class="btn btn-sm animated-button victoria-four">Learn more</a> </div>
  </div> -->
						<p>
						
						
							<input type="button" value="HOT" name="HOT">
							<input type="button" value="ICE" name="ICE">
						</p>
						<p class="hover-hot">
							<input type="hidden" value="덜뜨겁게" name="덜뜨겁게"> <input
								type="hidden" value="보통" name="보통"> <input type="hidden"
								value="더뜨겁게" name="더뜨겁게">
								
						</p>
						<p class="hover-ice">
							<input type="hidden" value="얼음 조금" name="얼음 조금"> <input
								type="hidden" value="보통" name="보통"> <input type="hidden"
								value="얼음 많이" name="얼음 많이">
						</p>
					</li>
					<hr>
					<li class="ok"><input type="submit" value="선택완료"></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>