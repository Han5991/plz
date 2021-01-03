<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMember(id);
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
<script src="member.js"></script>
<script type="text/javascript">
	$(document).on('keyup', '#textarea01', function(e) {
		var textarea01 = $(this).val();
		$('#cntSPAN').text(getBytes(textarea01));
	});

	function getBytes(str) {
		var cnt = str.length;
		return cnt;
	}

	$(document).ready(function() {
		//이메일선택
		$("select[name=select_email]").change(function() {
			$("input[name=email2]").val(this.value);
		});
	});
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

.jumbotron { /* 이 접근자로는 컨트롤 안 됨. */
	margin-bottom: 100px;
	background-color: blue;
}

.table {
	text-align: left;
	font-size: 16px;
	margin-bottom: 100px;
}

img {
	object-fit: cover
}

input[type=password] {
	font-family: arial;
}

input::placeholder {
	font-family: hzStyleFont;
	font-size: 12px;
}
</style>

<title>회원 정보 수정페이지</title>
</head>
<body style="background: lightgray">
	<!-- <h1 id="pageTit" class="pageName">회원가입</h1> -->
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




	<div class="jumbotron" style="background-color: lightgray;">
		<div class="container text-center">
			<div class="register_form">
				<form name="reg_frm" id="detailJoinForm" method="POST"
					action="modifyOk.jsp" autocomplete="off">
					<h2 id="pageTit" class="pageName">정보 수정</h2>
					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup>계정 정보</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="id_input">
										아이디 <br>
										<!-- <label style="display:none;" for="USER_ID">아이디</label> -->
										<input type="text" name="id" data-validation="1"
											maxlength="20" size="20" value="<%=dto.getId()%>"
											autocomplete="off" readonly="readonly" >
										<!-- <input type="hidden" name="DUP_YN" value="N">
                 <input type="hidden" name="MARKETING_YN" value="N">
                 <input type="hidden" name="LOCATION_YN" value="N"> -->

										<!-- 										<button class="button h60 btn_gray_dark" id="btn_dup" -->
										<!-- 											onclick="MemberDao.confirmId()">중복확인</button> -->

									</div> <br>
									<div class="pw_input">
										비밀번호<br>
										<!-- <label style="display:none;" for="PWD">비밀번호</label> -->
										<span><input style="font-family: arial;"
											type="password" name="pwd" data-validation="1" maxlength="14"
											placeholder="비밀번호(6~14자리)" autocomplete="new-password"></span>

										<!--                      <label style="display:none; " for="USER_PW_DUP">비밀번호 확인</label> -->
										<span><input style="font-family: arial;"
											type="password" name="pwd_check" data-validation="1"
											maxlength="14" placeholder="비밀번호 확인"></span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<table class="table">
						<thead style="font-size: 30px;">
							<tr>
								<td><sup>개인 정보 입력(필수)</sup></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>이름<br> <!-- <label style="display:inline;" for="USER_NAME">이름</label> -->
									<div class="name_input">
										<span><input type="text" placeholder="이름 입력"
											name="name" value="<%=dto.getName()%>" data-validation="1"
											maxlength="6" autocomplete="off" readonly="readonly"></span>
									</div> <br> 전화번호<br> <!-- <label style="display:inline;" for="USER_TEL">전화번호</label> -->
									<div class="tel_input">
										<span><input type="tel" placeholder="휴대폰 번호 ('-'제외)"
											name="tel" value="<%=dto.getTel()%>" data-validation="1"
											maxlength="11" formattype="number" autocomplete="off"></span>
									</div> <br> 생년월일<br> <!-- <label for="USER_BIRTH" style="display:inline;">생년월일</label> -->
									<div class="birth_input">
										<span><input type="date" placeholder="생년월일 입력"
											name="birthdate" value="<%=dto.getBirthdate()%>"
											data-validation="1"></span>
									</div> <br> 이메일<br> <!-- <label style="display:inline;" for="USER_EMAIL1 USER_EMAIL2">이메일</label> -->
									<div class="email_input">
										<span><input type="text" placeholder="이메일 주소 입력"
											name="email1" value="<%=dto.getEmail1()%>"
											data-validation="1" maxlength="50" autocomplete="off"><i>@</i></span>
										<span><input type="text" maxlength="50" name="email2"
											data-validation="1" value="<%=dto.getEmail2()%>"
											autocomplete="off"></span> <span> <select
											name="select_email" id="btn_email_select">
												<option value="">직접입력</option>
												<option value="naver.com">naver.com</option>
												<option value="daum.net">daum.net</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hotmail.com">hotmail.com</option>
												<option value="nate.com">nate.com</option>
												<option value="yahoo.co.kr">yahoo.co.kr</option>
										</select>
										</span>
									</div> <br> 주소<br> <!-- <label for="USER_ADDRESS" style="display:inline;">주소</label> -->
									<div class="address_input">
										<span><input type="text" placeholder="우편번호"
											name="postcode" minlength="5" maxlength="5" size="5"
											value="<%=dto.getPostcode()%>" data-validation="1"></span> <span><input
											type="button" value="우편번호 검색"></span><br> <span><input
											type="text" name="address1" value="<%=dto.getAddress1()%>"
											data-validation="1"></span> <span><input type="text"
											placeholder="상세주소 입력" name="address2"
											value="<%=dto.getAddress2()%>" data-validation="1"></span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="payment_reg">
						<table class="table">
							<thead style="font-size: 30px;">
								<tr>
									<td><sup>결제 정보 등록 (선택)</sup></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
<!-- 									null이 나오는 값들을 공백으로 치환해야함! -->
										<p>
											계좌번호<br>
											<!--    <label style="display:inline;" for="CREDIT_CARD CARD_EXP_DATE">신용카드</label> -->
											<select name="bankname" >
												<option value="<%if (dto.getBankname() == null) {%>
												<%=""%><%} else {%><%=dto.getBankname()%><%}%>" selected>은행을 선택하세요</option>
												<option value="신한은행">신한은행</option>
												<option value="국민은행">국민은행</option>
												<option value="농협">농협</option>
												<option value="하나은행">하나은행</option>
												<option value="우리은행">우리은행</option>
											</select>
										</p>
										<p class="account_no">
											계좌번호 입력<br> <span><input type="text"
												name="account_no" formattype="number"
												maxlength="15" size="15" data-validation="1" value="<%if (dto.getAccount_no() == null) {%>
												<%=""%><%} else {%><%=dto.getAccount_no()%><%}%>"></span>
										</p>

										<p class="payment_reg_info" style="font-size: 0.9em">
											<small>*자주 쓰는 카드를 등록하시면, 웹 주문시 자동 결제가 완료됩니다.</small>
										</p>

										<p>
											신용카드<br>
											<!--    <label style="display:inline;" for="CREDIT_CARD CARD_EXP_DATE">신용카드</label> -->
											<select name="cardname">
												<option
													value="<%if (dto.getCardname() == null) {%>
												<%=""%><%} else {%><%=dto.getCardname()%><%}%>"
													selected>카드를 선택하세요</option>
												<option value="신한카드">신한카드</option>
												<option value="비씨카드">비씨카드</option>
												<option value="국민카드">국민카드</option>
												<option value="NH농협카드">NH농협카드</option>
												<option value="현대카드">현대카드</option>
												<option value="삼성카드">삼성카드</option>
												<option value="하나카드">하나카드</option>
												<option value="롯데카드">롯데카드</option>
												<option value="씨티카드">씨티카드</option>
												<option value="우리카드">우리카드</option>
											</select>
										</p>
										<p class="card_number">
											카드번호 입력<br>
											<!-- <label style="display:inline;" for="CARD_NO1 CARD_NO2 CARD_NO3 CARD_NO4">카드번호</label> -->
											<span><input type="text" name="card_no1"
												formattype="number" minlength="4" maxlength="4" size="4"
												data-validation="1"
												value="<%if (dto.getCard_no1() == null) {%>
												<%=""%><%} else {%><%=dto.getCard_no1()%><%}%>"></span>
											<span><input type="text" name="card_no2"
												formattype="number" minlength="4" maxlength="4" size="4"
												data-validation="1"
												value="<%if (dto.getCard_no2() == null) {%>
												<%=""%><%} else {%><%=dto.getCard_no2()%><%}%>"></span>
											<span><input type="text" name="card_no3"
												formattype="number" minlength="4" maxlength="4" size="4"
												data-validation="1"
												value="<%if (dto.getCard_no3() == null) {%>
												<%=""%><%} else {%><%=dto.getCard_no3()%><%}%>"></span>
											<span><input type="text" name="card_no4"
												formattype="number" minlength="4" maxlength="4" size="4"
												data-validation="1"
												value="<%if (dto.getCard_no4() == null) {%>
												<%=""%><%} else {%><%=dto.getCard_no4()%><%}%>"></span>
										</p>
										<p class="card_exp_date">
											유효기간<br>
											<!-- <label style="display:inline;" for="EXP_MONTH EXP_YEAR">유효기간</label> -->
											<!-- <span><input type="month" name="EXP_MONTH" data-validation="1"></span> -->
											<select name="EXP_MONTH">
												<option
													value="<%if (dto.getExp_month() == null) {%>
												<%=""%><%} else {%><%=dto.getExp_month()%><%}%>">월(Month)</option>
												<option value="1">01</option>
												<option value="2">02</option>
												<option value="3">03</option>
												<option value="4">04</option>
												<option value="5">05</option>
												<option value="6">06</option>
												<option value="7">07</option>
												<option value="8">08</option>
												<option value="9">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select> <select name="EXP_YEAR">
												<option
													value="<%if (dto.getExp_year() == null) {%>
												<%=""%><%} else {%><%=dto.getExp_year()%><%}%>">년(Year)</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
											</select>
										</p> <input type="hidden" name="loginRedirect"
										value="/member/join_step4_basic">
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn_wrap">
							<!-- <button class="btn_blk button h60" id="btn_join">회원 가입</button> -->
							<input type="button" value="수정하기" class="btn btn-warning"onclick="updateInfoConfirm()"> 
								<input type="button"value="다시 입력하기" class="btn btn-warning"
								onclick="javascript:window.location='login.jsp'">
						</div>
					</div>

				</form>
			</div>

		</div>
	</div>


</body>
</html>