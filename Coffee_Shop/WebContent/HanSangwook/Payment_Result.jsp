<%@page import="com.javamini.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
String storeName = request.getParameter("search_shop"); //효연이가 만든 address.jpg 파일에서 검색창 부분 name값 받아오기
StoreDao dao = StoreDao.getInstance();
StoreDto dto = new StoreDto();
dto = (StoreDto) session.getAttribute("StoreId");

String name = request.getParameter("name");
//int price = Integer.parseInt(request.getParameter("price"));
int price = 10000;
//int quantity = Integer.parseInt(request.getParameter("quantity"));
int quantity = 10;
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
					<thead style="font-size: 60px; text-align:center">
						<tr>
							<td ><sup>결제가 성공적으로 완료되었습니다.</sup></td>
						</tr>
					</thead>
					<tr>
						<td style="font-size: 30px;">결제/주문 내역</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="padding: 0 0 0 0; margin:0 auto;width:50%;">
		<div class="jumbotron" style="float:left; width:50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>결제 금액</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>일반제품</td>
							<td>16,500원</td>
						</tr>
						<tr>
							<td>총 합계 금액</td>
							<td>16,500원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="jumbotron" style="float:left; width:50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>결제 수단</sup></td>
						</tr>
					</thead>
					<!-- 여기는 스크립틀릿으로 자바 넣어서 if문으로 일반 결제했으면 일반 결제, 현장결제 선택했으면 현장 결제 뜨도록 해야될 듯 -->
					<tbody>
						<tr>
							<td>
								신용카드&nbsp;&nbsp;&nbsp; [하나은행] &nbsp;&nbsp; 9900-6600-xxxx-xxxx</td>
						</tr>
						
						<tr>
							<td><button type="button" class="btn btn-info"
									data-toggle="collapse" data-target="#demo"
									style="background-color: #D9CDBC; border: none;">
									참고사항
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
		
		<div class="jumbotron" style="float:left; width:100%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>주문 상세
							<button type="button" class="btn btn-info"
									data-toggle="collapse" data-target="#detail"
									style="background-color: #D9CDBC; border: none;">
									상세 펼치기
								</button></sup>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div id="detail" class="collapse">
									<table class="table">
									<tr>
										<td><img src="../showImage?key1=<%=name%>" width="250"
								height="250" /></td>
							<td>메뉴 <%=name%></td>
							<input type="hidden" value="<%=name%>" name="name">
							<td>가격 <%=price%></td>
							<input type="hidden" value="<%=price%>" name="price">
							<td>수량 <%=quantity%></td>
							<input type="hidden" value="<%=quantity%>" name="quantity">
									</tr>
									</table>
								</div></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td>총 주문 금액</td>
							<td><%=price * quantity%>원</td>
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
		
		<div style="padding: 0 0 0 0; margin:0 auto;width:50%;">
		<div class="jumbotron" style="float:left; width:50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>매장 정보</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>매장 이름</td>
							<%-- <td><%=dto.getStoreName()%></td> --%>
							<%-- <td><%=dto.getStorePhone()%></td> --%>
							
						</tr>
						<tr>
							<td>매장 주소</td>
							<%-- <td><%=dto.getStoreAddress()%></td> --%>
							<td></td>
						</tr>
						<tr>
							<td>전화 번호</td>
							<%-- <td><%=dto.getStoreAddress()%></td> --%>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="jumbotron" style="float:left; width:50%">
			<div class="container text-center">
				<table class="table">
					<thead style="font-size: 30px;">
						<tr>
							<td><sup><span class="glyphicon glyphicon-stop"></span>주문 요청 사항</sup></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${param.DOC_TEXT}이 매장의 커피는 항상 만족스러워 좋습니다. 이번에 주문한 카페라떼에는 휘핑크림은 빼주시고 시나몬 가루는 듬뿍 부탁드려요! 
							코로나로 특별히 더욱 힘드실 텐데, 힘내세요~ 저희가 단골이 되겠습니다ㅎㅎ 화이팅!!
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		</div>
		
		<div class="jumbotron" >
			<div class="container text-center" >
			<div style="width:100%; float:left; margin: 0  0 40px 0">
				<input type="button" value="홈으로" class="btn btn-warning" onclick="javascript:document.location.href='#'">
				<input type="button" value="나의 주문 관리" class="btn btn-warning" onclick="javascript:document.location.href='#'">
			</div>
			</div>
		</div>
	</form>

</body>
</html>