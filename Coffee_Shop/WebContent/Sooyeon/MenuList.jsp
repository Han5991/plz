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
	margin: 0 auto;
	border-radius: 0;
	border: none;
	height: 70px;
	font-size: 20px;
	background-color: #D9CDBC;
	font-color: gray;
	position: relative;
}
/* .btnTab:after{
content:""; 
display:block; 
clear:both;
}
 */

/* .nav1 {
float : left;
padding:68px 0 0 0 ;
}
 */
a:hover:not (.active ) {
	color: white;
}

/* .spot{

position:absolute; 
left:0; 
top:0; 
}

.spot li {

float:left;
}
.spot li a {
font-size:20px;
font-color: gray;
display:block;
padding:15px 0;
height:52px;
} */
.menuProduct {
	list-style: none;
	margin: 10px; /* 이미지 위쪽 */
	padding: 50px;
}

.list {
	margin: 10px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

</style>

<title>메뉴 | Autumn Leaves</title>
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
		<div id="contents">
			<!-- <div id="section">내용
				<div class="tabArea menus"><nav></nav>?? -->
			<div class="btnTab text-center">
				<a href="#" class="active"><span class="all">전체</span></a> <a
					href="espresso.jsp"><span class="chi06">에스프레소</span></a> <a
					href="blended.jsp"><span class="chi08">블렌디드 </span></a> <a
					href="tea.jsp"><span class="chi01">티</span></a> <a href="etc.jsp"><span
					class="chi03">기타 음료</span></a> <a href="dessert.jsp"><span
					class="chi02">디저트</span></a>
			</div>
		</div>
	</div>

	<div id="tabCont01" class="tabConts">
		<ul class="menuProduct">
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/에스프레소.jpg" alt="에스프레소" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>에스프레소</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/아메리카노.jpg" alt="아메리카노" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>아메리카노</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/카푸치노.jpg" alt="카푸치노" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>카푸치노</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/카페모카.jpg" alt="카페모카" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>카페모카</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/카라멜 마키아토.jpg" alt="카라멜 마키아토" width="250"
						height="250" />
				</p>
				<dl class="text-center">
					<dt>카라멜 마키아토</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/화초모_아이스.jpg" alt="화초모_아이스" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>화이트 초코 모카</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/모카블렌.jpg" alt="모카블렌" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>모카 블렌디드</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/바닐라블렌.jpg" alt="바닐라블렌" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>바닐라 블렌디드</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/초코칩블렌.jpg" alt="초코칩블렌" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>초코칩 블렌디드</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/화초블렌.jpg" alt="화초블렌" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>화이트 초코 블렌디드</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/화초모블렌.jpg" alt="화초모블렌" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>화이트 초코 모카 블렌디드</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/그린티블렌.jpg" alt="그린티블렌" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>그린티 블렌디드</dt>
				</dl>
			</li>
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/흑임자블렌.jpg" alt="흑임자블렌" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>흑임자 블렌디드</dt>
				</dl>
			</li>
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/티_녹차.jpg" alt="녹차" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>녹차</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/티_캐모마일.jpg" alt="캐모마일" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>캐모마일</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/티_히비스커스.jpg" alt="히비스커스" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>히비스커스</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/티_얼그레이.jpg" alt="얼그레이" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>얼그레이</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/티_밀크티.jpg" alt="밀크티" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>얼그레이 밀크티</dt>
				</dl>
			</li>


			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/기_우유.jpg" alt="우유" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>우유</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/기_핫초코.jpg" alt="핫초코" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>핫초코</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/기_아포.jpg" alt="아포가토" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>아포가토</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/기_토피넛.jpg" alt="토피넛" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>토피넛 라떼</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/기_자몽에이드.jpg" alt="자몽에이드" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>자몽에이드</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/기_라임에이드.jpg" alt="라임에이드" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>라임에이드</dt>
				</dl>
			</li>
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/기_복숭아에이드.jpg" alt="복숭아에이드" width="250"
						height="250" />
				</p>
				<dl class="text-center">
					<dt>복숭아에이드</dt>
				</dl>
			</li>
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/디_블베.jpg" alt="블루베리 베이글" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>블루베리 베이글</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/디_치즈베이글.jpg" alt="치즈베이글" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>치즈베이글</dt>
				</dl>
			</li>
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="image/디_핫.jpg" alt="핫도그" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>핫도그</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/디_클스.jpg" alt="클래식 스콘" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>클래식 스콘</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/디_초스.jpg" alt="초코 스콘" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>초코 스콘</dt>
				</dl>
			</li>
			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/디_초크.jpg" alt="초코 크로아상" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>초코 크로아상</dt>
				</dl>
			</li>

			<li class="list">
				<!-- <a href="#"> -->
				<p class="img">
					<img src="../img/디_몽데.jpg" alt="몽블랑 데니쉬" width="250" height="250" />
				</p>
				<dl class="text-center">
					<dt>몽블랑 데니쉬</dt>
				</dl>
			</li>
		</ul>
	</div>
</body>
</html>