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


/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 1119px;
	text-align: center;
	vertical-align: middle;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.row.content {
		height: auto;
	}
}
#form{
	width: 330px;
   	height: 200px;
 	border: 3px solid lightgray;
 	border-radius: 20px;
 	margin : 80px auto;
}
</style>
</head>
<body>

<!-- Navigation -->
<%@ include file="navbar_admin.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-center">
				<h1>관리자 페이지</h1>
				<hr>
				
				<h3>메뉴 추가</h3>
				<form action="" id="form">
<!-- 					<div id="id">ID:<input type="text" placeholder="id"> </div> -->
<!-- 					<div id="pw">PW:<input type="password" placeholder="password"> </div> -->
<!-- 					<input type="submit" value="*로그인*" id="btn"> -->
				</form> 
			</div>

		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>

</body>
</html>