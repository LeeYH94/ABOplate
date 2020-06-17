/**
 * formSubmit() 회원가입 필수항목 검사 checkid(id) 회원가입 아이디 중복검사
 */
var check = false;

function formSubmit() {
	var form = document.signupForm;
	if ('' == form.member_id.value || !check) {
		alert('아이디를 확인해주세요.');
		/**
		 * Ajax 
//		 * 포커스X★ onmouseout  
		*/
		form.member_id.focus();
		return false;

	} else if ('' == form.member_email.value) {
		alert('이메일을 입력해주세요.');
		/**
		 * 
		 * DAO/Action
		 *회원가입 버튼 누를시
		 *-->alert 이메일중복(controller)
		 */
		form.member_pw.focus();
		return false;

	} else if ('' == form.member_password.value) {
		alert('비밀번호를 입력해주세요.');
		form.member_pw.focus();
		return false;

	} else if ('' == form.member_nickname.value) {
		alert('닉네임을 입력해주세요.');
		form.member_name.focus();
		return false;

	} else if ('' == form.member_stamp.value) {
		alert('추천을 입력해주세요.');
		form.member_age.focus();
		return false;

	} else if ('' == form.member_preference_food.value) {
		alert('선호음식을 입력해주세요.');
		form.member_email.focus();
		return false;
	} else if ('' == form.member_region.value) {
		alert('지역을 입력해주세요.');
		form.member_pw.focus();
		return false;

	} else if ('' == form.member_age_group.value) {
		alert('나이대를 입력해주세요.');
		form.member_pw.focus();
		return false;

	} 

	form.submit();
}

function checkid(id) {
	check = false;
	if (id == "") {
		$("#idCheck_text").text("아이디를 작성해주세요.");
	} else {
		$.ajax({
			url : contextPath + "/member/MemberCheckIdOk.me?id=" + id,
			// get방식
			type : 'get',
			dataType : 'text',
			success : function(data) {
				// trim()-공백 없애기.
				if (data.trim() == 'ok') {
					$("#idCheck_text").text("사용할 수 있는 아이디입니다.");
					check = true;
				} else {
					$("#idCheck_text").text("중복된 아이디입니다.");
				}
			},
			error : function() {
				console.log("오류");
			}
		})
	}
}

// 키보드 눌렀을때 적히고 땠을때 실행됨. -> 검색할때 사용하기!!
$("input[name='member_id']").keyup(function(event) {
	var id = $("input[name='member_id']").val();
	checkid(id);
})
