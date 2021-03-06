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
<script type="text/javascript">
/* 파일 삽입 시 이미지 미리보기 */
	function LoadImg(){
		var load = document.querySelector('img');
		var file = document.querySelector('input[type=file]').files[0];
		var reader = new FileReader();
		
		reader.addEventListener("load",function(){
			load.src = reader.result;
		}, false);
		
		if(file){
			reader.readAsDataURL(file);
		}
	}
</script>
<style>
@font-face {
	font-family: hzStyleFont;
	src: url("../font/ImcreSoojin.ttf");
}

* {
	font-family: hzStyleFont;
}


/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 880px;
	text-align: center;
	vertical-align: middle;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.row.content {
		height: auto;
	}
}
#form{
	width: 500px;
   	height: 700px;
 	border: 3px solid lightgray;
 	border-radius: 20px;
 	margin : 40px auto;
}

.input-file-button{
	width: 250px;
	height: 300px;
  	border-radius: 4px;
  	border: 1px solid lightgray;
  	background-color: lightgray;
  	cursor: pointer;
}

img{
	border-radius : 20px;
}
</style>
</head>
<body>

<!-- Navigation -->
<%@ include file="navbar_admin.jsp"%>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-12 text-center">
				<h1>관리자 페이지</h1>
				<hr>
				
				<h3>메뉴 추가</h3>
				<form action="" id="form" method="post">
					<div style="margin: 0 auto; text-align:center;" >
<!--<label class="input-file-button" for="input-file">이미지 업로드</label> -->
					<p><img src="" id="loadImg" width="300px" height="300px" onerror="this.src='../img/default_img.jpg'" style="margin-top: 20px;"></p>
					<p><input type="file" id="imgAttach" name="imgAttach" onchange="LoadImg()" style="margin-left:40px;"/></p>

					
						<p>
						<select name="category" required="required">
							<option value="category">select category</option>
							<option value="coffee">Coffee</option>
							<option value="nonCoffee">NonCoffee</option>
							<option value="tea">Tea</option>
							<option value="blended">Blended</option>
							<option value="etc">etc.</option>
						</select>
						</p>
						
						<p><input type="text" name="name" placeholder="name" autocomplete="off"></p>
						<p><input type="text" name="price" placeholder="price" autocomplete="off"></p>
						<p><textarea cols="20" rows="2" wrap="hard" placeholder="comment" style="resize: none;"></textarea>
					</div>
					<input type="submit" value="추가">
				</form> 
			</div>

		</div>
	</div>


</body>
</html>