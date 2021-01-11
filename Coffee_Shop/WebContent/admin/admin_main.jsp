<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

.dropdown {
  position: relative;
  display: inline-block;
  margin-top: 15px;
  margin-left: 15px;
  margin-right: 15px;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 70px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.jumbotron {
   margin-bottom: 20px;
}

.tab_motion{
	text-align: center;
 	text-decoration: none;	 
}
.tabmenu > ul {
    max-width: 1000px;
    margin: auto;
}
.tab_motion > li {
    display: inline-block; 
    font-size: 20px;
}
</style>

<title>관리자 페이지</title>
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
				
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a style="font-size:25px; padding-left:0px;">ADMIN</a></li>
					<li><a href="../admin/admin_main.jsp" style="color: #c25e00;">회원 관리</a></li>
					<li><a href="../CoffeeShop_Store/storeList.jsp">매장 관리</a></li>
					<li>
						<div class="dropdown">
  						<a style="color: #9d9d9d;">메뉴관리</a>
  						<div class="dropdown-content">
    						<p><a href="../HanSangwook/updateForm.jsp" style="color:black">수정</a></p>
						    <p><a href="../HanSangwook/insertForm.jsp" style="color:black">추가</a></p>
						    <p><a href="../HanSangwook/deleteForm.jsp" style="color:black">삭제</a></p>
						</div>
  
						</div>
					</li>

					<li><a href="#">주문 관리</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../Hyoyeon/logout.jsp"><span class="glyphicon glyphicon-log-in"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="jumbotron" style="background-color: white;">
      <div class="container text-center">
        <div class="tabmenu">
         <ul class="tab_motion">
         	<li>
         		<h2>메뉴 정보 수정</h2> 
         	</li>       
         </ul>
         
      </div>
   	</div>
   </div>

	