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
	int sum = 0;%>
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

.navbar {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	background-color: #D9CDBC;
}

ul {
	list-style: none;
}

#ul>li {
	width: 270px;
	height: 500px;
	margin: 5px;
	float: left;
	border: 3px solid lightgray;
	border-radius: 20px;
	text-align: left;
	padding: 5px;
}

#ul>li:active {
	background-color: lightgray;
}

footer {
	width: 100%;
	bottom: 0;
	position: fixed;
	background: lightgray;
	text-align: center;
}

.oderdetail {
	border-radius: 10px;
	border: 0px;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="navbar_admin.jsp"%>
	<h1 style="text-align: center;">주문 관리 페이지</h1>
	<hr>
	<ul id="ul">
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
		<li class="oderNum">주문번호 : <%=resultSet.getInt(1)%> <input
			name="oderNum" type="hidden" value="<%=resultSet.getInt(1)%>">
			<input name="storeid" type="hidden"
			value="<%=resultSet.getString(3)%>"><br> 주문시각 :<%=resultSet.getDate(5).toString()%>
			<br>주문상태 : 조리전<br> <input type="button" value="주문목록 보기"
			class="oderdetail">
			<table class="detail">
				<%
					for (MenuDto a : Menudtos) {
					sum += a.getPrice() * a.getQuantity();
				%>
				<tr>
					<td><%=a.getName()%></td>
					<td><%=a.getQuantity()%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td>총계 : <%=sum%></td>
				</tr>
			</table>
		</li>
		<%
			}
		con.close();
		preparedStatement.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</ul>
	<footer>
		<input type="button" value="주문 취소" class="btn btn-warning"
			style="font-size: 30px;">&nbsp;&nbsp;<input type="button"
			value="조리 시작" class="btn btn-warning" style="font-size: 30px;">&nbsp;&nbsp;<input
			type="button" value="영수증 출력" class="btn btn-warning"
			style="font-size: 30px;" onclick="print()">
	</footer>
</body>
<script type="text/javascript">
var num =0;
	$('.detail').hide();
	$('.oderNum').click(function() {
		var n = $('.oderNum').index(this);
		num = $("input[name=oderNum]:eq(" + n + ")").val();
	});
	$('.oderdetail').click(function() {
		var n = $('.oderdetail').index(this);
		if ($(".detail:eq(" + n + ")").css("display") == "none") {
			$(".detail:eq(" + n + ")").show();
			$(".oderdetail:eq(" + n + ")").val("주문목록 숨기기");
		} else {
			$(".detail:eq(" + n + ")").hide();
			$(".oderdetail:eq(" + n + ")").val("주문목록 보기");
		}
	});
	
	function print() {
		var url = "../receiptPrint.do?odernum="+num;
		window.open(url, "receiptPrint","toolbar=no, menubar=no,scrollbar=yes, resizable=no, width=450,height=800");
	}
</script>
</html>