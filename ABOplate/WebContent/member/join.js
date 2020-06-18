/**
 * formSubmit() 회원가입 필수항목 검사 checkid(id) 회원가입 아이디 중복검사
 */
var check = false;

function formSubmit() {
	var form = document.jonForm;
	if ('' == form.memberId.value || !check) {
		alert('아이디를 확인해주세요.');
		form.memberName.focus();
		return false;

	} else if ('' == form.memberName.value) {
		alert('이름을 입력해주세요.');
		form.memberEmail.focus();
		return false;
	} else if ('' == form.memberEmail.value) {
		alert('이메일을 입력해주세요.');
//		if (onmouseout) {	
//			
//			}
		
		form.meberPassword.focus();
		return false;
 
	} else if ('' == form.meberPassword.value) {
		alert('비빌번호');
		form.memberRePassword.focus();
		return false;
	} else if ('' == form.memberRePassword.value) {
		alert('비빌번호 확인');
		form.meberNickname.focus();
		return false;

	} else if ('' == form.meberNickname.value) {
		alert('닉네임을 입력해주세요.');
		form.member_name.focus();
		return false;

	} else if ('' == form.memberFavorite.value) {
		alert('선호음식을 입력해주세요.');
		form. memberRegion.focus();
		return false;
	} else if ('' == form. memberRegion.value) {
		alert('지역을 입력해주세요.');
		form.member_pw.focus();
		return false;

	} else if ('' == form. memberRegion.value) {
		alert('나이대를 입력해주세요.');
		return false;

	form.submit();
}

	function check email(email) {
		
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

// 키보드 눌렀을때 적히고 땠을때 실행됨. -> 검색할때 사용하기!!
$("input[name='member_id']").keyup(function(event) {
	var id = $("input[name='member_id']").val();
	checkid(id);
})
