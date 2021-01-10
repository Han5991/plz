<%@page import="Coffee_Shop.menu.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.javamini.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String storeName = request.getParameter("search_shop"); //효연이가 만든 address.jpg 파일에서 검색창 부분 name값 받아오기
StoreDao dao = StoreDao.getInstance();
StoreDto dto = (StoreDto) session.getAttribute("storeId");

ArrayList<MenuDto> Menudtos = new ArrayList<MenuDto>();
Menudtos = (ArrayList) session.getAttribute("orderList");
MenuDto Menudto = null;
int sum = 0;
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
	$(document).on('keyup', '#textarea01', function(e) {
		var textarea01 = $(this).val();
		$('#cntSPAN').text(getBytes(textarea01));
	});

	function getBytes(str) {
		var cnt = str.length;
		return cnt;
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
	background-color: white;
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

		<div class="jumbotron">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup>매장 정보</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>매장 주소</td>
							<td><%=dto.getStoreAddress()%></td>
							<td></td>
						</tr>
						<tr>
							<td>포장 매장</td>
							<td><%=dto.getStoreName()%></td>
							<td><%=dto.getStorePhone()%></td>
						</tr>
						<tr>
							<td>포장 예상시간</td>
							<td>null분</td>
							<td></td>
						</tr>
						<tr>
							<td>주문 요청 사항</td>
							<td><textarea style="width: 350px; resize: none;"
									id="textarea01" name="DOC_TEXT" maxlength="20">
</textarea></td>
							<td><span id="cntSPAN">0</span>&nbsp;<span>/최대 20글자</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="jumbotron">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup>주문 제품</sup></td>
						</tr>
					</thead>
					<tbody>
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
							sum += Menudto.getPrice()*Menudto.getQuantity();
						}
						%>
						<tr>
							<td></td>
							<td></td>
							<td>총 주문 금액</td>
							<td><%=sum%>원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="jumbotron">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup>결제정보</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="glyphicon glyphicon-stop"></span>일반결제<br>
								<div class="radio">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn  btn-warning"> <input type="radio"
											name="jb-radio" id="jb-radio-3">신용카드
										</label> <label class="btn btn-warning"> <input type="radio"
											name="jb-radio" id="jb-radio-3">계좌이체
										</label>
									</div>
								</div></td>
						</tr>
						<tr>
							<td><span class="glyphicon glyphicon-stop"></span>현장결제<br>
								<div class="radio">
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn  btn-warning"> <input type="radio"
											name="jb-radio" id="jb-radio-3">신용카드
										</label> <label class="btn  btn-warning"> <input type="radio"
											name="jb-radio" id="jb-radio-3">현금결제
										</label>
									</div>
								</div></td>
						</tr>
						<tr>
							<td><button type="button" class="btn btn-info"
									data-toggle="collapse" data-target="#demo"
									style="background-color: #D9CDBC; border: none;">
									<span class="glyphicon glyphicon-stop"></span>주문 전에 꼭 참고하세요
								</button>
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

		<div class="jumbotron" style="margin-bottom: 0px">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup>결제 금액</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>일반제품</td>
							<td><%=sum%>원</td>
						</tr>
						<tr>
							<td>총 합계 금액</td>
							<td><%=sum%>원</td>
						</tr>
						<tr>
							<td><input type="reset" value="주문 다시 하기"
								class="btn btn-warning"><input type="submit"
								value="결제 및 주문완료" class="btn btn-warning"></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
</body>
</html>