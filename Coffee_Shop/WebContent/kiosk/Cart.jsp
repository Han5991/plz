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

img {
	width: 150px;
	height: 150px;
}

table {
	width: 800px;
	margin: auto;
}
</style>
</head>
<body>

	<!-- Navigation -->
	<%@ include file="navbar_user.jsp"%>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-10">
				<h1>장바구니</h1>
				<hr>
				<table>
					<tr>
						<td><h3>주문 제품</h3></td>
						<td><h3>이름</h3></td>
						<td><h3>수량</h3></td>
						<td><h3>가격</h3></td>
					<tr>
						<td><img src="../img/menuImg/blended_흑임자블렌.jpg" width="150"
							height="150" /></td>
						<td>흑임자블렌</td>
						<td>1개</td>
						<td>4000원</td>
					</tr>
					<tr>
						<td><img src="../img/menuImg/blended_모카블렌.jpg" width="150"
							height="150" /></td>
						<td>모카블렌</td>
						<td>1개</td>
						<td>4500원</td>
					</tr>
				</table>
			</div>

			<div class="col-sm-2 sidenav">
				<h2>
					총 합계 금액 : <br>8500원
				</h2>
				<br> <br> <input type="reset" value="메뉴 추가하기"
					class="btn btn-warning" style="font-size: 30px;"><br>
				<br> <input type="submit" value="주문 하기" class="btn btn-warning"
					style="font-size: 30px;">
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>

</body>
</html>