<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
	font-family: hzStyleFont;
	src: url("../font/ImcreSoojin.ttf");
}

* {
	font-family: hzStyleFont;
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

input {
	border-radius: 10px;
	border: 0px;
}
</style>
</head>
<body>
	<%
		String a = (String) request.getAttribute("oneOder");
	String oder[] = a.split(",");
	String num = oder[oder.length - 3];
	String sum = oder[oder.length - 2];
	String date = oder[oder.length - 1];
	%>
	<ul id="ul">
		<li class="oderNum">주문번호 : <%=num%><br> 주문시각 : <%=date%><br>주문상태
			: 조리전
			<table>
				<%
					for (int i = 0; i < oder.length - 3;) {
				%>
				<tr>
					<td>
						<%
							out.print(oder[i]);
						%>
					</td>
					<td>
						<%
							out.print(oder[++i]);
						i++;
						%>
					</td>
				</tr>
				<%
					}
				%>
				<tr>
					<td>총계 :<%=sum%></td>
				</tr>
				<tr>
					<td><input type="button" value="영수증 출력" onclick="print()"></td>
				</tr>
			</table>
		</li>
	</ul>
</body>
</html>