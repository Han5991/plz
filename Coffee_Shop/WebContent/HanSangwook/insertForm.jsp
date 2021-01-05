<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메뉴 추가 페이지</h2>
	<form action="../insertOk" method="post" enctype="multipart/form-data"
		name="reg_frm">
		Type : <select name="type" required="required">
			<option value="type">타입을 선택해주세요</option>
			<option value="blended_">blended</option>
			<option value="dessert_">dessert</option>
			<option value="espresso_">espresso</option>
			<option value="etc_">etc</option>
			<option value="tea_">tea</option>
		</select> <br> Name : <input type="text" name="name" required="required"><br>
		price : <input type="text" name="price" required="required"><br>
		image : <input type="file" name="image" required="required"><br>
		<input type="button" value="submit" onclick="infoConfirm()">
	</form>
	<a href="../Sooyeon/espresso.jsp">에스프레소 메뉴</a>
	<br>
	<a href="../Sooyeon/blended.jsp">블렌디드 메뉴</a>
	<br>
	<a href="../Sooyeon/tea.jsp">티 메뉴</a>
	<br>
	<a href="../Sooyeon/etc.jsp">기타 메뉴</a>
	<br>
	<a href="../Sooyeon/dessert.jsp">디저트 메뉴</a>
	<br>
</body>
<script type="text/javascript">
	function infoConfirm() {
		if (document.reg_frm.type.value=="type") {
			alert("타입은 필수 사항입니다.");
			reg_frm.type.focus();
			return;
		}
		document.reg_frm.submit();
	}
</script>
</html>