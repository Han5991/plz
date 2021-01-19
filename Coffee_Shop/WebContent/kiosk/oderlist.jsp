<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Calendar calendar = Calendar.getInstance();
int h = calendar.get(Calendar.HOUR_OF_DAY);
int m = calendar.get(Calendar.MINUTE);
int s = calendar.get(Calendar.SECOND);
%>
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

td {
	padding-right: 20px;
}

img {
	margin: 0px;
	border-radius: 10px;
}

ul {
	list-style: none;
}

#ui>li {
	margin: 5px;
	width: 270px;
	float: left;
	border: 3px solid lightgray;
	border-radius: 20px;
	text-align: left;
	float: left;
	width: 270px;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="navbar_user.jsp"%>
	<div class="container-fluid text-center">
		<div class="row content text-center">
			<div class="col-sm-11" align="center">
				<h1>주문 관리 페이지</h1>
				<hr>
				<ul id=ui>
					<%
						for (int i = 1; i < 10; i++) {
					%>
					<li>주문번호 : <%=i%><br> 주문시각 : <%=h%>시<%=m%>분<%=s%>초<br>
						주문목록 :
						<table>
							<tr>
								<td><img src="../img/menuImg/blended_그린티블렌.jpg" width="100"
									height="100" /></td>
								<td colspan="3">수량 : 1<br>금액 : 5000원<br></td>
							</tr>
							<tr>
								<td><img src="../img/menuImg/blended_그린티블렌.jpg" width="100"
									height="100" /></td>
								<td colspan="3">수량 : 1<br>금액 : 5000원<br></td>
							</tr>
							<tr>
								<td><img src="../img/menuImg/blended_그린티블렌.jpg" width="100"
									height="100" /></td>
								<td colspan="3">수량 : 1<br>금액 : 5000원<br></td>
							</tr>
						</table>
					</li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="col-sm-1 sidenav">
				<div class="well">
					<p>ADS</p>
				</div>
				<div class="well">
					<p>ADS</p>
				</div>
				<input type="reset" value="주문 취소" class="btn btn-warning"
					style="font-size: 30px;"><br> <br> <input
					type="submit" value="조리 시작" class="btn btn-warning"
					style="font-size: 30px;">
			</div>
		</div>
	</div>

</body>
</html>