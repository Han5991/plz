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
	padding: 0px;
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
.menu {
	width: 500px;
	height: 600px;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin: 30px;
	font-size: 24px;
	display: inline-block;
	float: left;
}

.img{
	width: 300px;
	height: 350px;

}

img {
	width: 300px;
	height: 300px;
	margin-top: 70px;
	display:block;
	margin : 90px;
	
	
}

.font{
	font-size: 180%;
}


</style>
</head>
<body>

	<!-- Navigation -->
	<%@ include file="navbar_user.jsp"%>
	
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-center" style="margin:250px;">
				
					<div class="div_menu">

						<div class="menu" onclick="javascript:window.location='menu_list.jsp'"> 
							<p class="img">
								<img src="../img/coffee.png" />
								<p class="font" style="margin:20px;">매장에서 식사</p>
						</div>
					</div>
						
						<div class="menu" onclick="javascript:window.location='menu_list.jsp'">
						
							<p class="img">
								<img src="../img/take-away.png" />
							</p>
							
							<div class="text-center">
								<p class="font" style="margin:20px;">포장</p>
							</div>
						</div>
				</div>
			</div>
		</div>
</body>
</html>