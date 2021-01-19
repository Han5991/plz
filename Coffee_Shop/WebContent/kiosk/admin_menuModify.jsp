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
#form{
	width: 330px;
   	height: 200px;
 	border: 3px solid lightgray;
 	border-radius: 20px;
 	margin : 80px auto;
}
#id{
 	margin: 20px  80px; 
}	
#pw{
 	margin: 0px  80px; 
}
#btn{
	margin: 20px 0; 
	margin-left: 120px;
}
</style>
</head>
<body>

<!-- Navigation -->
<%@ include file="navbar_admin.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-9 text-left">
				<h1>관리자 페이지</h1>
				<hr>
				
				<h3>메뉴 수정</h3>
				<form action="" id="form">
<!-- 					<div id="id">ID:<input type="text" placeholder="id"> </div> -->
<!-- 					<div id="pw">PW:<input type="password" placeholder="password"> </div> -->
<!-- 					<input type="submit" value="*로그인*" id="btn"> -->
				</form> 
			</div>
			<div class="col-sm-3 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>

</body>
</html>