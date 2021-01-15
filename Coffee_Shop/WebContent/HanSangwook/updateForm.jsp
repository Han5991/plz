<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="Coffee_Shop.menu.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!Context context = null;
	DataSource dataSource = null;
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet resultSet = null;
	String name = null;
	String filename = null;
	int price = 0;
	String update = null;%>
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

.btnTab {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	height: 70px;
	font-size: 20px;
	background-color: lightgray;
	font-color: gray;
}

.btnTab > a{
	color: #c67100;
	padding: 0 20px;
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

li {
    list-style: none;
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
<title>Insert title here</title>
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
					<li><a href="../admin/admin_main.jsp">회원 관리</a></li>
					<li><a href="../CoffeeShop_Store/storeList.jsp">매장 관리</a></li>
					<li>
						<div class="dropdown">
  						<a style="color: #c25e00;">메뉴관리</a>
  						<div class="dropdown-content">
    						<p><a href="updateForm.jsp" style="color:#c25e00">수정</a></p>
						    <p><a href="insertForm.jsp" style="color:black">추가</a></p>
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
         		<h2>메뉴 정보 수정</h2> 
         	</li>       
         </ul>
         
      </div>
   	</div>
   </div>
	
	<div id="container">
		<div id="section">
			<div class="tabArea navbar- menus">
				<div class="btnTab text-center">
					<a href="../Sooyeon/MenuList.jsp" class="active"><span class="all">전체</span></a>
					<a href="../Sooyeon/espresso.jsp"><span class="chi06">에스프레소</span></a>
					<a href="../Sooyeon/blended.jsp"><span class="chi08">블렌디드 </span></a>
					<a href="../Sooyeon/etc.jsp"><span class="chi01">티</span></a>
					<a href="etc.jsp"><span class="../Sooyeon/etc.jsp">기타 음료</span></a>
					<a href="../Sooyeon/dessert.jsp"><span class="chi02">디저트</span></a>
				</div>
			</div>
		</div>
	</div>
	<form action="../updateOk" enctype="multipart/form-data" name="reg_frm"
		method="post">
		<div id="tabCont01" class="tabConts">
			<ul class="menuProduct">
				<%
					try {
					context = new InitialContext();
					dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
					con = dataSource.getConnection();
				} catch (Exception e) {
					e.printStackTrace();
				}

				try {
					update = request.getParameter("filename");
					stmt = con.prepareStatement("SELECT * FROM menu WHERE filename='" + update + "'");
					resultSet = stmt.executeQuery();
					while (resultSet.next()) {
						name = resultSet.getString("name");
						price = resultSet.getInt("price");
						filename = resultSet.getString("filename");
				%>
				<li class="list">
					<p class="img">
						<img src="../showImage?key1=<%=name%>" width="250" height="250" />
					</p>
					<dl class="text-center">
						<dt>
							Type : <select name="type">
								<option value="type">타입을 선택해주세요</option>
								<option value="blended_">blended</option>
								<option value="dessert_">dessert</option>
								<option value="espresso_">espresso</option>
								<option value="etc_">etc</option>
								<option value="tea_">tea</option>
							</select>
						</dt>
						<dt>
							메뉴 :<input type="text" value="<%=name%>" name="name"
								required="required">
						</dt>
						<dt>
							가격 : <input type="text" value="<%=price%>" name="price"
								required="required">
						</dt>
						<dt>
							image : <input type="file" name="image" required="required">
						</dt>
						<dt>
							<input type="hidden" value="<%=filename%>" name="filename">
						</dt>
					</dl>
				</li>
				<%
					}
				} catch (Exception e) {
				e.printStackTrace();
				} finally {
				try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
				} catch (Exception e) {
				e.printStackTrace();
				}
				}
				%>
			</ul>
		</div>
		<input type="button" value="수정" onclick="infoConfirm()">
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