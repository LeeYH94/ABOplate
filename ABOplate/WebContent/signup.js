/**
 * formSubmit() 회원가입 필수항목 검사 checkid(id) 회원가입 아이디 중복검사
 */
var check = false;


function formSubmit() {
	var form = document.signupForm;
	
	if ('' == form.memberId.value || !check) {
		alert('아이디를 확인해주세요.');
		form.memberId.focus();
		return false;

	} else if ('' == form.memberName.value) {
		alert('이름을 입력해주세요.');
		form.memberName.focus();
		return false;
	} else if ('' == form.memberEmail.value||!check) {
		alert('이메일을 입력해주세요.');	
				 form.memberEmail.focus();
		return false;
 
	} else if ('' == form.meberPassword.value) {
		alert('비빌번호');
		 form.meberPassword.focus();
		return false;
	} else if ('' == form.memberRePassword.value) {
		alert('비빌번호 확인');
		form.memberRePassword.focus();
		return false;

	} else if ('' == form.meberNickname.value) {
		alert('닉네임을 입력해주세요.');
		form.meberNickname.focus();
		return false;

	} else if ('' == form.memberFavorite.value) {
		alert('선호음식을 입력해주세요.');
		form.memberFavorite.focus();
		return false;
		
	} else if ('' == form. memberRegion.value) {
		alert('나이대를 입력해주세요.');
		return false;
		
		
	} else if ('' == form. memberRegion.value) {
		alert('지역을 입력해주세요.');
		form. memberRegion.focus();
		return false;

		form.submit();
	}

	
		
	
function checkid(id) {
	check = false;
	if (id == "") {
		$("#idCheck_text").text("아이디를 작성해주세요.");
	} else {
		$.ajax({
			url : contextPath + "/member/MemberCheckIdOk.me?id=" + id,
			
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				if (data.trim() == 'ok') {
					$("#idCheckText").text("사용할 수 있는 아이디입니다.");
					check = true;
				} else {
					$("#idCheckText").text("중복된 아이디입니다.");
				}
			},
			error : function() {
				console.log("오류");
			}
		})
	}
}


$("input[name='memberId']").focusout(function(event) {
	var id = $("input[name='memberId']").val();
	checkid(id);
})


}





//function checkemail(email) {
//	check = false;
//	if (email == "") {
//		$("#emailCheck_text").text("이메일 작성해주세요.");
//	} else {
//		$.ajax({
//			url : contextPath + "/member/MemberCheckEmailOk.me?email=" + email,
//			
//			type : 'get',
//			dataType : 'text',
//			success : function(data) {
//				
//				if (data.trim() == 'ok') {
//					$("#emailCheckText").text("사용할 수 있는 이메일입니다.");
//					check = true;
//				} else {
//					$("#emailCheckText").text("중복된이메일입니다.");
//				}
//			},
//			error : function() {
//				console.log("오류");
//			}
//		})
//	}
//}
//
//
//$("input[name='memberEmail']").focusout(function(event) {
//	var id = $("input[name='memberEmail']").val();
//	checkid(id);
//})
