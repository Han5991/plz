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

.div_menu {

}
.menu{
	width: 200px;
   	height: 300px;
 	border: 1px solid lightgray;
 	border-radius: 10px;
 	margin : 30px;
 	font-size: 24px;
 	display: inline-block;
 	float:left;
}

.list {
	list-style: none;
}

img {
	width: 150px;
	height: 150px;
	margin-top: 5px;
	border-radius: 10px;
}

.footer-button {
  display: flex;
  justify-content: center;
}
</style>
</head>
<body>

<!-- Navigation -->
<%@ include file="navbar_admin.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12" align="center">
				<h1>관리자 페이지</h1>
				<hr>
				<h3>메뉴 삭제</h3>
				<div class="div_menu">
				<form>
				<%
					for(int i = 0; i < 20; i++){
				%>
						<div class="menu">
							<p class="img">
								<img src="../img/menuImg/blended_흑임자블렌.jpg"/>
							</p>
							<div class="text-center">
								<p>흑임자 블렌드</p>
								<p>3000원</p>
								<p>
									<input type="button" value='삭제하기' id="delete" class="btn btn-warning">
								</p>
							</div>
						</div>
				<%
					}
				%>
					</form>
				</div>
			</div>
		</div>
	</div>
<script>
$("#delete").click(function(){
    if(confirm("정말 삭제하시겠습니까 ?") == true){
        alert("삭제되었습니다");   
    }
    else{
        return;
    }
});
</script>
</body>
</html>