var idCheck = false;
var nicknameCheck = false;

function formSubmit() {
  	var form = document.modifyForm;

  	 if ('' == form.memberPassword.value) {
		alert("현재 비밀번호를 입력해주세요");
		form.memberPassword.focus();
		return false;
	} else if ('' == form.newMemberPassword.value) {
		alert("새로운 비밀번호 확인을 입력해주세요");
		form.newMemberPassword.focus();
		return false;
	} else if (form.newMemberPassword.value != form.newMemberRePassword.value) {
		form.newMemberRePassword.focus();
		alert("비밀번호 확인이 일치하지 않습니다");
		return false;
	} else if(form.memberPassword.value==form.newMemberPassword.value){
		alert("현재 비밀번호와 일치합니다. 새로운 비밀번호를 입력해주세요");
		form.newMemberPassword.focus();
		return false;
	}	
	else if ('' == form.memberFavorite.value) {
		alert("선호음식을 입력해주세요");
		return false;

	}
		else if ('' == form.memberRegion.value) {
		alert("지역을 입력해주세요");
		return false;

	}
	form.submit();
}
function output(){
	var form = document.modifyForm;
//	var id = contextPath + "/member/MemberLogin.me?id="
//				+ $("input[name='memberId']").val(),
	 form.memberId.value = smk1656;
}

function modify(){

	
	form.modify();
}
