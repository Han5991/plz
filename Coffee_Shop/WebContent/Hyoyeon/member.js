function infoConfirm(){
	
	if(document.reg_frm.id.value.length == 0){
		alert("아이디는 필수 사항입니다.");
		reg_frm.id.focus(); //form 태그인 reg_frm의 id에 focus주기
		return;
	}
	
	if(document.reg_frm.id.value.length < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.id.focus(); //form 태그인 reg_frm의 id에 focus주기
		return;
	}
	
	if(document.reg_frm.pwd.value.length == 0){
		alert("비밀번호는 필수 사항입니다.");
		reg_frm.pwd.focus(); //form 태그인 reg_frm의 pwd에 focus주기
		return;
	}
	
	if(document.reg_frm.pwd.value.length < 6){
		alert("비밀번호는 6~14 글자로 입력해야 합니다.");
		reg_frm.pwd.focus(); //form 태그인 reg_frm의 pwd에 focus주기
		return;
	}
	

	if((document.reg_frm.pwd.value) != (document.reg_frm.pwd_check.value)){
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.pwd.focus(); //form 태그인 reg_frm의 pwd에 focus주기
		return;
	}
	
	if(document.reg_frm.name.value.length == 0){
		alert("이름은 필수 사항 입니다.");
		reg_frm.name.focus(); 
		return;
	}
	
	if(document.reg_frm.email1.value.length == 0 || document.reg_frm.email2.value.length == 0){
		alert("메일은 필수 사항입니다.");
		reg_frm.email1.focus();
		return;
	}
	
	document.reg_frm.submit(); //submit버튼이 눌렸을때에 대한 함수이니까!
}

function updateInfoConfirm(){
	if(document.reg_frm.pwd.value == ""){
		alert("패스워드를 입력하세요.");
		document.reg_frm.pwd.focus();
		return;
	}
	
	if((document.reg_frm.pwd.value) != (document.reg_frm.pwd_check.value)){
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.pwd.focus();
		return;
	}
	
	if(document.reg_frm.email1.value.length == 0 || document.reg_frm.email2.value.length == 0 ){
		alert("메일은 필수 사항입니다.");
		reg_frm.email1.focus(); 
		return;
	}
	
	document.reg_frm.submit();
}

