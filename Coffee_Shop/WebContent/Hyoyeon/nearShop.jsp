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
/*     list-style-type: none; */
    font-size: 20px;
/*     font-color: black; */
	
}

.tab_motion a{
	padding: 50px;
}

/* .contents_inner >ul{
	text-decoration: none;
} */

#place {
/* 	position: absolute; */
/* 	display: inline; */
	background-image: url(../img/place_icon.png);
	background-size: 49px 49px;
	background-color: white;
	width: 53px;
	height: 49px;
	border: 0px;
}

.btn{
	float: left;
	margin: 20px 0px 10px 20px;
}
li {
    list-style: none;
}

</style>

<title>매장 선택 | 카페 2020</title>
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
        <div class="tabmenu">
         <ul class="tab_motion">
         	<li>
         		<a href="address.jsp" >검색하기</a> 
         	</li>
         	<li>
         		<a href="#" >가까운 매장</a> 
         	</li>
         	<li>
         		<a href="" >이전 주문매장</a> 
         	</li>
         
         </ul>
         
      </div>
   	</div>
   </div>


	<div class="jumbotron" style="background-color: white;">
		<div class="container text-center">
		
			<div class="contents_inner">
				<ul class="store_list">
					<li>
						<button type="button" class="btn btn-secondary" class="btn">선택불가</button> 
						<strong>하계1호<i class="km">0.4km</i></strong> 
							<span>서울 노원구 하계 1동 251 청구상가 201동 101호</span>
						<button type="button" id="place"></button><hr>
					</li>
					<li>
						<button type="button" class="btn btn-success" class="btn">선택</button> 
						<strong>중계역<i class="km">0.7km</i></strong> 
							<span>서울 노원구 중계2동 503</span>
						<button type="button" id="place"></button><hr>
					</li>


				</ul>

			</div>
		</div>
	</div>

</body>
</html>





























