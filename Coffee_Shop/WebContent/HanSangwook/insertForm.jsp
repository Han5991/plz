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
</head>
<body>
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
					<li><a href="../admin/admin_main.jsp">회원 관리</a></li>
					<li><a href="../CoffeeShop_Store/storeList.jsp">매장 관리</a></li>
					<li>
						<div class="dropdown">
  						<a style="color: #c25e00;">메뉴관리</a>
  						<div class="dropdown-content">
    						<p><a href="updateForm.jsp" style="color:black">수정</a></p>
						    <p><a href="insertForm.jsp" style="color:#c25e00">추가</a></p>
						    <p><a href="deleteForm.jsp" style="color:black">삭제</a></p>
						</div>
  
						</div>
					</li>

					<li><a href="../HanSangwook/oderlist.jsp">주문 관리</a></li>
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
         		<h2>메뉴 정보 추가</h2> 
         	</li>       
         </ul>
         
      </div>
   	</div>
   </div>

	
	<form action="../insertOk" method="post" enctype="multipart/form-data" name="reg_frm">
		<div class="jumbotron">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><h2>메뉴 추가 </h2></td>
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
							<td colspan="2"><input type="button" value="메뉴 추가"
								onclick="infoConfirm()" class="btn btn-warning"></td>
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