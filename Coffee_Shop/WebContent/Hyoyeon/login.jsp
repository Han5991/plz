<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

.container {
	width: 400px;
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

.btn {
	margin: 8px;
}

input[type=password] {
	font-family: arial;
}

input::placeholder {
	font-family: hzStyleFont;
}
</style>
</head>
<body style="background: lightgray">
	<!-- 상단 바 -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><b>가을잎새~</b></a>
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

	<div class="container text-center">
		<div class="row">
			<h2>로그인</h2>
			<img alt="" src="">
			<!-- 로고 이미지 -->
			<form action="loginOk.jsp" method="post" class="needs-validation" novalidate>
				<div class="form-group">
					<input type="text" class="form-control" id="id" placeholder="아이디"
						name="id" required>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" id="pwd" placeholder="비밀번호"
						name="pwd" size="10" style="color: black;" required>
				</div>
				<div class="form-group form-check">
					<label class="form-check-label">
					<input class="form-check-input" type="checkbox" name="remember">아이디 저장
					</label>
				</div>
				<input type="submit" class="btn btn-secondary" value="로그인">
			</form>

			<button class="btn btn-secondaary" type="button" data-toggle="collapse" data-target="#collapseExample"
				aria-expanded="false" aria-controls="collapseExample">로그인이 안되십니까?</button>

			<div class="collapse" id="collapseExample">
				<div class="card card-body">
					<input type="button" class="btn btn-secondary" value="아이디 찾기"
						onclick="location.href='loginFind.jsp'">
					<input type="button" class="btn btn-secondary" value="비밀번호 찾기"
						onclick="location.href='loginFind.jsp'">
				</div>
			</div>
			<div>
				<input type="button" class="btn btn-secondary" value="비회원주문"
					onclick="location.href='/register'">
				<input type="button" class="btn btn-secondary" value="회원가입"
					onclick="location.href='join.jsp'">
			</div>
		</div>
	</div>
</body>
<script>
	// Disable form submissions if there are invalid fields
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Get the forms we want to add validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
</html>