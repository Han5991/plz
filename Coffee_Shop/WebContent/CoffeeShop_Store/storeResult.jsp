<%@ page import="com.javamini.StoreDao"%>
<%@ page import="com.javamini.StoreDto"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
String storeName = request.getParameter("search_shop"); //효연이가 만든 address.jpg 파일에서 검색창 부분 name값 받아오기
StoreDao dao = StoreDao.getInstance();
%>
<%!StoreDto dto;
	String storeId, storeAddress, storePhone;%>

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

.jumbotron {
	margin-bottom: 20px;
}
/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.table {
	text-align: left;
}

.tab_motion {
	text-align: center;
}

.tabmenu>ul {
	max-width: 1000px;
	margin: auto;
}

.tab_motion>li {
	display: inline-table;
	list-style-type: none;
	font-size: 20px;
	/*     font-color: black; */
}

.tab_motion a {
	padding: 50px;
}

.form-control {
	display: inline-block;
	width: 50%;
	height: 50px;
}

#btn_search {
	position: absolute;
	background-image: url(../img/ico_search_btn.png);
	background-size: 49px 49px;
	background-color: white;
	width: 49px;
	height: 49px;
	border: 1;
}

.store_list {
	overflow: hidden;
	width: 70%;
	padding: 0 10px 10px;
	margin: 0 auto;
	text-align: center;
}

.store_list tr {
	overflow: hidden;
	line-height: 100px;
	list-style: none;
	border-bottom: 2px solid lightgray;
	position: relative
}

.store_list tr span {
	margin-left: 0px;
	font-size: 14px;
}
</style>

<title>매장 검색 결과</title>
</head>
<body style="background: lightgray">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Portfolio</a>
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

	<div class="jumbotron" style="background-color: white;">
		<div class="container text-center">
			<form action="storeResult.jsp" method="post" name="search">
				<input type="text" placeholder="매장명 검색" id="search_shop"
					name="search_shop" size="10" class="form-control">
				<button type="submit" id="btn_search"></button>
				<br> <br> <br> <br>
				<h4>찾으실 매장명을 검색하세요.</h4>
			</form>
		</div>
	</div>

	<p style="margin-left: 380px; font-size: 20px">검색 결과</p>

	<div class="jumbotron" style="background-color: white;">
		<div class="container text-center">

			<table class="store_list" border="0">
				<tr>
					<td><span style="margin-left: 10px"><strong>매장
								이름</strong></span></td>
					<td><span><strong>매장 주소</strong></span></td>
					<td><span><strong>전화번호</strong></span></td>
					<td><span><strong>선택</strong></span></td>
				</tr>
				<%
					ArrayList<StoreDto> dtos = dao.getStoreByName(storeName);

				for (int i = 0; i < dtos.size(); i++) {
					dto = dtos.get(i);
					storeId = dto.getStoreId();
					storeName = dto.getStoreName();
					storeAddress = dto.getStoreAddress();
					storePhone = dto.getStorePhone();
				%>
				<tr>
					<td><span style="margin-left: 10px"><%=dto.getStoreName()%></span></td>
					<td><span><%=dto.getStoreAddress()%></span></td>
					<td><span><%=dto.getStorePhone()%></span></td>
					<td>
						<form action="../Sooyeon/MenuList.jsp" method="post">
							<input type="hidden" value="<%=dto.getStoreId()%>">
							<%session.setAttribute("StoreId", dao.getStore(dto.getStoreId()));%>
							<button type="submit" class="btn btn-warning">선택</button>
						</form>
					</td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>

</body>
</html>
