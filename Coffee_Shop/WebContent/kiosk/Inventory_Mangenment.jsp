<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.sql.DataSource"%>
<%!Context context = null;
	DataSource dataSource = null;
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet resultSet = null;
	String name = null;%>
<%
	request.setCharacterEncoding("UTF-8");
try {
	context = new InitialContext();
	dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
	con = dataSource.getConnection();

	stmt = con.prepareStatement("SELECT * FROM menu WHERE filename LIKE 'dessert%'");
	resultSet = stmt.executeQuery();
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
<style>
@font-face {
	font-family: hzStyleFont;
	src: url("../font/ImcreSoojin.ttf");
}

* {
	font-family: hzStyleFont;
}

.btnTab {
	margin-bottom: 0;
	border-radius: 0;
	border: none;
	height: 70px;
	font-size: 20px;
	background-color: lightgray;
	font-color: gray;
	line-height: 70px;
}

a:hover:not (.active ) {
	color: white;
}

#inventory {
	text-align: center;
	margin: auto;
	border:
}

footer {
	width: 100%;
	bottom: 0;
	position: fixed;
	background: lightgray;
	text-align: center;
}

input {
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation -->
	<%@ include file="navbar_admin.jsp"%>
	<h1 style="text-align: center;">재고 관리 페이지</h1>
	<hr>
	<form>
		<table id=inventory>
			<tr>
				<td>품목</td>
				<td>판매가격</td>
				<td>입고(개)</td>
				<td>현재고(개)</td>
				<td>입고후재고(개)</td>
			</tr>
			<%
				while (resultSet.next()) {
				name = resultSet.getString("name");
			%>
			<tr>
				<td><%=name%><input type="hidden" value="<%=name%>" name="menu"></td>
				<td><%=resultSet.getInt("price")%></td>
				<td><input type="button" value="-" name="maineoseu"><input
					type="text" value="0" class="stock1"><input type="button"
					value="+" name="plus"></td>
				<td><input type="text" value="5000" readonly="readonly"
					class="stock2"></td>
				<td><input type="text" readonly="readonly" name="stock3" value="5000"></td>
			</tr>
			<%
				}
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			con.close();
			stmt.close();
			}
			%>
		</table>

		<footer class="container-fluid text-center">
			<input type="reset" value="입고 취소" class="btn btn-warning"
				style="font-size: 30px;"><input type="submit" value="입고"
				class="btn btn-warning" style="font-size: 30px;">
		</footer>
	</form>
</body>
<script type="text/javascript">
	$('input[name=plus]').click(function() {
		var n = $('input[name=plus]').index(this);
		var num = $(".stock1:eq(" + n + ")").val();
		$(".stock1:eq(" + n + ")").val(++num);
		var n2 = $(".stock2:eq(" + n + ")").val();
		$("input[name=stock3]:eq(" + n + ")").val(num * 1 + n2 * 1);
	});

	$('input[name=maineoseu]').click(function() {
		var n = $('input[name=maineoseu]').index(this);
		var num = $(".stock1:eq(" + n + ")").val();
		if (num > 0) {
			$(".stock1:eq(" + n + ")").val(--num);
		}
		$("input[name=stock3]:eq(" + n + ")").val(num);
		var n2 = $(".stock2:eq(" + n + ")").val();
		$("input[name=stock3]:eq(" + n + ")").val(num * 1 + n2 * 1);
	});
</script>
</html>