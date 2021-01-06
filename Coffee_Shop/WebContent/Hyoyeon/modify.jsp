<%@page import="com.javalec.ex.MemberDto"%>
<%@page import="com.javalec.ex.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String) session.getAttribute("id");
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = dao.getMember(id);

	//selected된 value로 다시 설정해주기 위함.
	String bankname = dto.getBankname();
	if(bankname == null) bankname = "";
	
	String cardname = dto.getCardname();
	if(cardname == null) cardname = "";
	
	String exp_year = dto.getExp_year();
	if(exp_year == null) exp_year = "";

	String exp_month = dto.getExp_month();
	if(exp_month == null) exp_month = "";
	

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
	$(document).ready(function() {
		//이메일선택
		$("select[name=select_email]").change(function() {
			$("input[name=email2]").val(this.value);
		});
		
		//카드번호 공백출력_하위선택자 찾아보기.
		if($('input[name=card_no1]').val() == "null"){
			$('input[name=card_no1]').val("");
		}
		if($('input[name=card_no2]').val() == "null"){
			$('input[name=card_no2]').val("");
		}
		if($('input[name=card_no3]').val() == "null"){
			$('input[name=card_no3]').val("");
		}
		if($('input[name=card_no4]').val() == "null"){
			$('input[name=card_no4]').val("");
		}
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

										<input type="text" name="id" data-validation="1"
											maxlength="20" size="20" value="<%=dto.getId()%>"
											autocomplete="off" readonly="readonly" >
									</div> <br>
									<div class="pw_input">
										비밀번호<br>

										<span><input style="font-family: arial;"
											type="password" name="pwd" data-validation="1" maxlength="14"
											placeholder="비밀번호(6~14자리)" autocomplete="new-password"></span>


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
								<td>이름<br>
									<div class="name_input">
										<span><input type="text" placeholder="이름 입력"
											name="name" value="<%=dto.getName()%>" data-validation="1"
											maxlength="6" autocomplete="off" readonly="readonly"></span>
									</div> <br> 전화번호<br>
									<div class="tel_input">
										<span><input type="tel" placeholder="휴대폰 번호 ('-'제외)"
											name="tel" value="<%=dto.getTel()%>" data-validation="1"
											maxlength="11" formattype="number" autocomplete="off"></span>
									</div> <br> 생년월일<br>
									<div class="birth_input">
										<span><input type="date" placeholder="생년월일 입력"
											name="birthdate" value="<%=dto.getBirthdate()%>"
											data-validation="1"></span>
									</div> <br> 이메일<br>
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
									</div> <br> 주소<br>
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
											<select name="bankname" id="bankname">
												<option value="0" <%=bankname.equals("")|| bankname == null?"selected":""%>>은행을 선택하세요</option>
												<option value="1" <%=bankname.equals("1")?"selected":""%>>신한은행</option>
												<option value="2" <%=bankname.equals("2")?"selected":""%>>국민은행</option>
												<option value="3" <%=bankname.equals("3")?"selected":""%>>농협</option>
												<option value="4" <%=bankname.equals("4")?"selected":""%>>하나은행</option>
												<option value="5" <%=bankname.equals("5")?"selected":""%>>우리은행</option>
											</select>
										</p>
										
										<p >
											계좌번호 입력<br> <span><input type="text"
												name="account_no" id="account_no"
												maxlength="15" size="15" data-validation="1" value="<%=dto.getAccount_no()%>"></span>
										</p>

										<p class="payment_reg_info" style="font-size: 0.9em">
											<small>*자주 쓰는 카드를 등록하시면, 웹 주문시 자동 결제가 완료됩니다.</small>
										</p>

										<p>
											신용카드<br>
											<select name="cardname" id="cardname">
												<option value="0" <%=cardname.equals("0")|| cardname == null?"selected":""%>>카드를 선택하세요</option>
												<option value="1" <%=cardname.equals("1")?"selected":""%>>신한카드</option>
												<option value="2" <%=cardname.equals("2")?"selected":""%>>비씨카드</option>
												<option value="3" <%=cardname.equals("3")?"selected":""%>>국민카드</option>
												<option value="4" <%=cardname.equals("4")?"selected":""%>>NH농협카드</option>
												<option value="5" <%=cardname.equals("5")?"selected":""%>>현대카드</option>
												<option value="6" <%=cardname.equals("6")?"selected":""%>>삼성카드</option>
												<option value="7" <%=cardname.equals("7")?"selected":""%>>하나카드</option>
												<option value="8" <%=cardname.equals("8")?"selected":""%>>롯데카드</option>
												<option value="9" <%=cardname.equals("9")?"selected":""%>>씨티카드</option>
												<option value="10" <%=cardname.equals("10")?"selected":""%>>우리카드</option>
											</select>
										</p>
										<p>
											카드번호 입력<br>
											<span><input type="text" name="card_no1" maxlength="4" size="4"
												data-validation="1" value="<%=dto.getCard_no1()%>"></span>
											<span><input type="text" name="card_no2"
												maxlength="4" size="4"
												data-validation="1"
												value="<%=dto.getCard_no2()%>"></span>
											<span><input type="text" name="card_no3"
												 maxlength="4" size="4"
												data-validation="1"
												value="<%=dto.getCard_no3()%>"></span>
											<span><input type="text" name="card_no4"
												 maxlength="4" size="4"
												data-validation="1"
												value="<%=dto.getCard_no4()%>"></span>
										</p>
										<p class="card_exp_date">
											유효기간<br>
											<select name="exp_month" >
												<option value="0" <%=exp_month.equals("0")|| exp_month == null?"selected":""%>>월(Month)</option>
												<option value="1" <%=exp_month.equals("1")?"selected":""%>>01</option>
												<option value="2" <%=exp_month.equals("2")?"selected":""%>>02</option>
												<option value="3" <%=exp_month.equals("3")?"selected":""%>>03</option>
												<option value="4" <%=exp_month.equals("4")?"selected":""%>>04</option>
												<option value="5" <%=exp_month.equals("5")?"selected":""%>>05</option>
												<option value="6" <%=exp_month.equals("6")?"selected":""%>>06</option>
												<option value="7" <%=exp_month.equals("7")?"selected":""%>>07</option>
												<option value="8" <%=exp_month.equals("8")?"selected":""%>>08</option>
												<option value="9" <%=exp_month.equals("9")?"selected":""%>>09</option>
												<option value="10" <%=exp_month.equals("10")?"selected":""%>>10</option>
												<option value="11" <%=exp_month.equals("11")?"selected":""%>>11</option>
												<option value="12" <%=exp_month.equals("12")?"selected":""%>>12</option>
											</select> 월 &nbsp;&nbsp;
											<select name="exp_year">
												<option
													value="0" <%=exp_year.equals("")|| exp_year == null?"selected":""%>>년(Year)</option>
												<option value="1" <%=exp_year.equals("1")?"selected":""%>>21</option>
												<option value="2" <%=exp_year.equals("2")?"selected":""%>>22</option>
												<option value="3" <%=exp_year.equals("3")?"selected":""%>>23</option>
												<option value="4" <%=exp_year.equals("4")?"selected":""%>>24</option>
												<option value="5" <%=exp_year.equals("5")?"selected":""%>>25</option>
												<option value="6" <%=exp_year.equals("6")?"selected":""%>>26</option>
												<option value="7" <%=exp_year.equals("7")?"selected":""%>>27</option>
												<option value="8" <%=exp_year.equals("8")?"selected":""%>>28</option>
												<option value="9" <%=exp_year.equals("9")?"selected":""%>>29</option>
												<option value="10" <%=exp_year.equals("10")?"selected":""%>>30</option>
											</select> 년도
										</p> <input type="hidden" name="loginRedirect"
										value="/member/join_step4_basic">
									</td>
								</tr>
							</tbody>
						</table>
						<div class="btn_wrap">
							<input type="button" value="수정하기" class="btn btn-warning" onclick="updateInfoConfirm()"> 
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