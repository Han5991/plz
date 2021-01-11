<%@page import="Coffee_Shop.menu.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javamini.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
StoreDto dto = (StoreDto) session.getAttribute("storeId");

ArrayList<MenuDto> Menudtos = new ArrayList<MenuDto>();
Menudtos = (ArrayList) session.getAttribute("orderList");
MenuDto Menudto = null;
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
	margin-bottom: 0px;
	background-color: white;
	padding: 0 0 0 0;
}

.table {
	text-align: left;
	font-size: 20px;
}

img {
	object-fit: cover
}
</style>
<title>결제 정보</title>
</head>
<body style="background: lightgray">
	<form>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Portfolio</a>
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

		<div class="jumbotron" style="padding: 40px 0 0 0;">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 60px; text-align: center">
						<tr>
							<td><sup>${user.name}님 결제가 성공적으로 완료되었습니다.</sup></td>
						</tr>
					</thead>
					<tr>
						<td style="font-size: 30px;">결제/주문 내역</td>
					</tr>
				</table>
			</div>
		</div>

		<div style="padding: 0; margin: 0 auto; width: 50%;">
			<div class="jumbotron" style="float: left; width: 50%">
				<div class="container text-center">
					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup><span class="glyphicon glyphicon-stop"></span>결제
										금액</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>일반제품</td>
								<td>${param.sum}원</td>
							</tr>
							<tr>
								<td>총 합계 금액</td>
								<td>${param.sum}원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="jumbotron" style="float: left; width: 50%">
				<div class="container text-center">
					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup><span class="glyphicon glyphicon-stop"></span>결제
										수단</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>신용카드&nbsp;&nbsp;&nbsp; [${user.bankname}] &nbsp;&nbsp;
									${user.account_no}</td>
							</tr>

							<tr>
								<td><button type="button" class="btn btn-info"
										data-toggle="collapse" data-target="#demo"
										style="background-color: #D9CDBC; border: none;">
										참고사항</button>
									<div id="demo" class="collapse">
										- 주문 결제 이후 3분 이내 취소 가능하며, 제품 조리시는 취소 및 환불이 불가능합니다.<br> -
										주문 후 기타 문의사항은 소비자 상담전화(080-320-3000)로 연락바랍니다.<br> - 18시 ~
										21시는 주문량이 많은 시간대로 배달이 지연 될 수 있으니 양해 부탁드립니다.<br> - 주문 완료 전
										배송지와 연락처를 다시 한번 확인해 주시기 바랍니다.<br>
									</div></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="jumbotron" style="float: left; width: 100%">
				<div class="container text-center">
					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup><span class="glyphicon glyphicon-stop"></span>주문
										상세
										<button type="button" class="btn btn-info"
											data-toggle="collapse" data-target="#detail"
											style="background-color: #D9CDBC; border: none;">상세
											펼치기</button></sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div id="detail" class="collapse">
										<table class="table">
											<%
												for (int b = 0; b < Menudtos.size(); b++) {
												Menudto = Menudtos.get(b);
											%>
											<tr>
												<td><img src="../showImage?key1=<%=Menudto.getName()%>"
													width="250" height="250" /></td>
												<td><%=Menudto.getName()%></td>
												<td><%=Menudto.getPrice()%></td>
												<td><%=Menudto.getQuantity()%></td>
											</tr>
											<%
											}
											%>
										</table>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td>총 주문 금액</td>
								<td>${param.sum}원</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="jumbotron" style="padding: 50px 0 0 0;">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td style="font-size: 30px;">수령 매장 정보</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>

		<div style="padding: 0 0 0 0; margin: 0 auto; width: 50%;">
			<div class="jumbotron" style="float: left; width: 50%">
				<div class="container text-center">
					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup><span class="glyphicon glyphicon-stop"></span>매장
										정보</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>매장 이름</td>
								<td><%=dto.getStoreName()%>
								${storeId.storeName}</td>
								<td></td>
							</tr>
							<tr>
								<td>매장 주소</td>
								<td><%=dto.getStoreAddress()%>${storeId.storeAddress}</td>
								<td></td>
							</tr>
							<tr>
								<td>전화 번호</td>
								<td><%=dto.getStorePhone()%></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="jumbotron" style="float: left; width: 50%">
				<div class="container text-center">
					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup><span class="glyphicon glyphicon-stop"></span>주문
										요청 사항</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${param.DOC_TEXT}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="jumbotron">
			<div class="container text-center">
				<div style="width: 100%; float: left; margin: 0 0 40px 0">
					<input type="button" value="홈으로" class="btn btn-warning"
						onclick="javascript:document.location.href='#'"> <input
						type="button" value="나의 주문 관리" class="btn btn-warning"
						onclick="javascript:document.location.href='#'">
				</div>
			</div>
		</div>
	</form>

</body>
</html>