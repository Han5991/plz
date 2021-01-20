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

#ul>li {
	margin: 5px;
	width: 300px;
	float: left;
	border: 3px solid lightgray;
	border-radius: 20px;
	text-align: left;
	width: 270px;
	padding: 5px;
}

#ul>li:active {
	background-color: lightgray;
}

footer {
	width: 100%;
	bottom: 0;
	position: fixed;
	background: lightgray;
	text-align: center;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="navbar_user.jsp"%>
	<h1>주문 관리 페이지</h1>
	<hr>
	<ul id="ul" class="active">
		<%
			for (int i = 1; i < 10; i++) {
		%>
		<li class="oderNum">주문번호 : <%=i%><br> 주문시각 : <%=h%>시<%=m%>분<%=s%>초<br>주문상태
			: 조리전<br> 주문목록 :
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
	<footer class="container-fluid text-center">
		<input type="reset" value="주문 취소" class="btn btn-warning"
			style="font-size: 30px;"><input type="submit" value="조리 시작"
			class="btn btn-warning" style="font-size: 30px;">
	</footer>

</body>
<script type="text/javascript">
	$(function() {
		$('.oderNum').click(function() {
			var n = $('.oderNum').index(this)+1;
			console.log(n);
		});
	})
</script>
</html>