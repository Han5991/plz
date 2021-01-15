<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="Coffee_Shop.menu.*"%>
<%!Context context = null;
	DataSource dataSource = null;
	Connection con = null;
	ByteArrayInputStream inputStream = null;
	PreparedStatement preparedStatement = null;
	ArrayList<MenuDto> Menudtos = null;
	ResultSet resultSet = null;
	ObjectInputStream ois = null;
	InputStream in = null;
	int s = 0;
	byte[] buffer = null;
	Blob menu = null;
	int i = 0;%>
<%
	try {
	context = new InitialContext();
	dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
	con = dataSource.getConnection();

	preparedStatement = con.prepareStatement("select * from oderlist order by oderlistnum");
	resultSet = preparedStatement.executeQuery();
%>
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
<script type="text/javascript">
	function deleteConfirm() {
		const result = confirm("정말 삭제하시겠습니까?");
		console.log(result);
		if (result) {
			document.deleteButton.submit();
		} else {
			history.go(-1);
		}
	}
</script>
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

.tab_motion {
	text-align: center;
	text-decoration: none;
}

.tabmenu>ul {
	max-width: 1000px;
	margin: auto;
}

.tab_motion>li {
	display: inline-block;
	/*     list-style-type: none; */
	font-size: 20px;
	/*     font-color: black; */

	/* .contents_inner >ul{
	text-decoration: none;
} */
}

li {
	list-style: none;
}

.store_list {
	overflow: hidden;
	width: 90%;
	padding: 0 10px 10px;
	margin: 0 auto;
	text-align: center;
}

.store_list tr {
	overflow: hidden;
	line-height: 100px;
	list-style: none;
	border-bottom: 2px solid lightgray;
	position: relative
}

.store_list tr span {
	margin-left: 0px;
	font-size: 14px;
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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>

<title>매장 관리 페이지 | 카페 2020</title>
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
					<li><a style="font-size: 25px; padding-left: 0px;">ADMIN</a></li>
					<li><a href="../admin/admin_main.jsp">회원 관리</a></li>
					<li><a href="../CoffeeShop_Store/storeList.jsp"
						style="color: #c25e00;">매장 관리</a></li>
					<li>
						<div class="dropdown">
							<a style="color: #9d9d9d;">메뉴관리</a>
							<div class="dropdown-content">
								<p>
									<a href="../HanSangwook/updateForm.jsp" style="color: black">수정</a>
								</p>
								<p>
									<a href="../HanSangwook/insertForm.jsp" style="color: black">추가</a>
								</p>
								<p>
									<a href="../HanSangwook/deleteForm.jsp" style="color: black">삭제</a>
								</p>
							</div>
						</div>
					</li>
					<li><a href="#">주문 관리</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../Hyoyeon/logout.jsp"><span
							class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="jumbotron" style="background-color: white;">
		<div class="container text-center">
			<div class="tabmenu">
				<ul class="tab_motion">
					<li>
						<h2>주문 관리 페이지</h2>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<div class="jumbotron" style="background-color: white;">
		<div class="container text-center">

			<div class="contents_inner">
				<table class="store_list" border="0">
					<tr>
						<td width="120"><span style="margin-left: 10px"><strong>주문
									번호</strong></span></td>
						<td width="120"><span><strong>아이디</strong></span></td>
						<td width="120"><span><strong>매장아이디</strong></span></td>
						<td width="120"><span><strong>주문일자</strong></span></td>
						<td width="120"><span><strong>주문목록</strong></span></td>
					</tr>
					<%
						while (resultSet.next()) {

						menu = resultSet.getBlob(4);

						in = menu.getBinaryStream();
						s = (int) menu.length();
						buffer = new byte[s];
						in.read(buffer, 0, s);

						ois = new ObjectInputStream(new ByteArrayInputStream(buffer));
						Menudtos = (ArrayList<MenuDto>) ois.readObject();
					%>
					<tr>
						<td><span style="margin-left: 10px"><%=resultSet.getInt(1)%></span></td>
						<td><span><%=resultSet.getString(2)%></span></td>
						<td><span><%=resultSet.getString(3)%></span></td>
						<td><span><%=resultSet.getDate(5).toString()%></span></td>
						<td><span class="glyphicon glyphicon-stop"></span>주문 상세
<button type="button" class="btn btn-info" data-toggle="collapse"
								data-target="#detail<%=i%>"
								style="background-color: #D9CDBC; border: none;">상세 펼치기</button></td>
						<td>
							<div id="detail<%=i%>" class="collapse">
								<table class="table">
									<%
										for (MenuDto a : Menudtos) {
										i++;
									%>
									<tr>
										<td><img src="../showImage?key1=<%=a.getName()%>"
											width="100" height="100" /></td>
										<td><%=a.getName()%></td>
										<td><%=a.getPrice()%></td>
										<td><%=a.getQuantity()%></td>
									</tr>
									<%
										}
									%>
								</table>
							</div>
						</td>
					</tr>
					<%
						}
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</table>
				<span><button type="button" class="btn btn-success"
						style="margin: 15px 0 0 0"
						onclick="javascript:window.location='../Sooyeon/MenuList.jsp'">메뉴리스트로
						가기</button></span>
			</div>
		</div>
	</div>

</body>
</html>