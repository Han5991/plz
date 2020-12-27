<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.btnTab {
margin-bottom: 0;
   border-radius: 0;
   border: none;
height:70px;
font-size:20px;
   background-color: #D9CDBC;
   font-color: gray;
}

 a:hover:not(.active) {
    color: white;
}

.menuProduct {
    list-style:none;
    margin:10px; /* 이미지 위쪽 */
    padding:50px;
}

.list {
    margin: 10px;
    padding: 0 0 0 0;
    border : 0;
    float: left;
}

.txt {
 text-align : center;
}

</style>
<title>Insert title here</title>
</head>
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
		<!-- <div id="contents"> -->		
			<div id="section"><!-- 내용 -->
				<div class="tabArea navbar- menus">
					<div class="btnTab">
						<a href="#" class="active"><span class="all">전체</span></a>
						<a href="espresso.jsp"><span class="chi06">에스프레소</span></a>
						<a href="blended.jsp"><span class="chi08">블렌디드 </span></a>
						<a href="tea.jsp"><span class="chi01">티</span></a>
						<a href="etc.jsp"><span class="chi03">기타 음료</span></a>
						<a href="dessert.jsp"><span class="chi02">디저트</span></a>					
					</div>
	


	<div id="tabCont01" class="tabConts">
		<ul class="menuProduct">
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img"><img src="image/디_블베.jpg" alt="블루베리 베이글" width="250" height="250" /></p>
				<dl class="txt">
					<dt>블루베리 베이글</dt>
				</dl>
			</li>
			
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img"> 
					<img src="image/디_치즈베이글.jpg" alt="치즈베이글" width="250" height="250" />
				</p>
				<dl class="txt">
					<dt>치즈베이글</dt>
				</dl>
			</li>
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/디_핫.jpg" alt="핫도그" width="250" height="250" />
				</p>
				<dl class="txt">
					<dt>핫도그</dt>
				</dl>
			</li>
			
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/디_클스.jpg" alt="클래식 스콘" width="250" height="250" />
				</p>
				<dl class="txt">
					<dt>클래식 스콘</dt>
				</dl>
			</li>
			
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/디_초스.jpg" alt="초코 스콘" width="250" height="250" />
				</p>
				<dl class="txt">
					<dt>초코 스콘</dt>
				</dl>
			</li>	
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/디_초크.jpg" alt="초코 크로아상" width="250" height="250" />
				</p>
				<dl class="txt">
					<dt>초코 크로아상</dt>
				</dl>
			</li>
			
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/디_몽데.jpg" alt="몽블랑 데니쉬" width="250" height="250" />
				</p>
				<dl class="txt">
					<dt>몽블랑 데니쉬</dt>
				</dl>
			</li>
			<li class = "list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/디_빨.jpg" alt="빨미까레" width="250" height="250" />
				</p>
				<dl class="txt">
					<dt>빨미까레</dt>
				</dl>
			</li>
		
	</div>

</body>
</html>