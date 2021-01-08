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
	int price = 0;%>
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
	<form action="updateForm.jsp">
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
					stmt = con.prepareStatement("SELECT * FROM menu");
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
							메뉴 :
							<%=name%></dt>
						<dt>
							가격 :
							<%=price%></dt>
						<dt>
							수정 선택 <input type="radio" value='<%=filename%>' name="filename">
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
		<input type="submit" value="수정">
	</form>
</body>
</html>