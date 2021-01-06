<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.jumbotron {
	margin-bottom: 20px;
	background-color: white;
}

.table {
	text-align: left;
	font-size: 20px;
}

img {
	object-fit: cover
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
</style>
</head>
<body>
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
		<div id="section">
			<div class="tabArea navbar- menus">
				<div class="btnTab text-center">
					<a href="../Sooyeon/MenuList.jsp" class="active"><span
						class="all">전체</span></a> <a href="../Sooyeon/espresso.jsp"><span
						class="chi06">에스프레소</span></a> <a href="../Sooyeon/blended.jsp"><span
						class="chi08">블렌디드 </span></a> <a href="../Sooyeon/etc.jsp"><span
						class="chi01">티</span></a> <a href="etc.jsp"><span
						class="../Sooyeon/etc.jsp">기타 음료</span></a> <a
						href="../Sooyeon/dessert.jsp"><span class="chi02">디저트</span></a>
				</div>
			</div>
		</div>
	</div>
	<form action="../insertOk" method="post" enctype="multipart/form-data" name="reg_frm">
		<div class="jumbotron">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><h2>메뉴 추가 페이지</h2></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="2">Type : <select name="type"
								required="required">
									<option value="type">select type</option>
									<option value="blended_">blended</option>
									<option value="dessert_">dessert</option>
									<option value="espresso_">espresso</option>
									<option value="etc_">etc</option>
									<option value="tea_">tea</option>
							</select></td>
						</tr>
						<tr>
							<td>Name : <input type="text" name="name"
								required="required"></td>
							<td>price : <input type="text" name="price"
								required="required"></td>

						</tr>
						<tr>
							<td>image : <input type="file" name="image"
								required="required"></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2"><input type="button" value="submit"
								onclick="infoConfirm()"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	function infoConfirm() {
		if (document.reg_frm.type.value == "type") {
			alert("타입은 필수 사항입니다.");
			reg_frm.type.focus();
			return;
		}
		document.reg_frm.submit();
	}
</script>
</html>