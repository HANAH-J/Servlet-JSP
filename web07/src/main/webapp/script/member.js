/**
 * 
 */
function updateCheck() {
	// 암호와 암호확인 일치여부 체크
	if(document.frm.userpwd.value != document.frm.pwd_check.value) {
		alert('비밀번호가 일치하지 않습니다.');
		document.frm.userpwd.value = '';
		document.frm.pwd_check.value = '';
		
		document.frm.userpwd.focus();
		return false;
	}
	return true;
}

function joinCheck() {
	// 암호화 암호 확인 일치 여부 체크
	if(document.frm.userpwd.value != document.frm.pwd_check.value) {
		alert('비밀번호가 일치하지 않습니다.');
		document.frm.userpwd.value = '';
		document.frm.pwd_check.value = '';
		
		document.frm.userpwd.focus();
		return false;
	}
	
	// 아이디 중복을 확인했는지 체크
	if(document.frm.reid.value.length == 0){
		alert('아이디 중복 확인을 하지 않았습니다.');
		document.frm.userid.focus();
		return false;
	}
	return true;
}

function idCheck() {
	// 아이디가 입력이 되었는지 체크
	if(document.frm.userid.value.length == 0){
		alert('아이디를 입력해 주세요.');
		document.frm.userid.focus();
		return false;
	}
	
	// 새로운 창 열기를 통해서 진행
	// window.open('어디로', '윈도우 이름', '옵션');
	
	let url = "idCheck?userid=" + document.frm.userid.value;
			// 쿼리 스트링
	window.open(url, "_blank1", "toolbar=no, menubar=no, scrollbars=yes, width=450, height=200");
}

function idOk() {
	// 중복 확인된 아이디를 회원가입 폼에 넣어준다.
	opener.document.frm.userid.value = document.frm.userid.value;
	// 부모창에 있는 userid				   idCheck.jsp에 있는 userid 
	opener.document.frm.reid.value = document.frm.userid.value;
	
	// 새로 열린 창 닫기
	self.close();
}