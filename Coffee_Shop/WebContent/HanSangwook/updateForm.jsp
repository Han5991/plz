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

.btnTab {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	height: 70px;
	font-size: 20px;
	background-color: #D9CDBC;
	font-color: gray;
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
		<div id="section">
			<div class="tabArea navbar- menus">
				<div class="btnTab text-center">
					<a href="../Sooyeon/MenuList.jsp" class="active"><span
						class="all">전체</span></a> <a href="../Sooyeon/espresso.jsp"><span
						class="chi06">에스프레소</span></a> <a href="../Sooyeon/blended.jsp"><span
						class="chi08">블렌디드 </span></a> <a href="../Sooyeon/etc.jsp"><span
						class="chi01">티</span></a> <a href="etc.jsp"><span
						class="../Sooyeon/etc.jsp">기타 음료</span></a> <a
						href="../Sooyeon/dessert.jsp"><span class="chi02">디저트</span></a>
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