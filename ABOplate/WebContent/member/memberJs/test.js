/**
 * formSubmit() 회원가입 필수항목 검사 checkid(id) 회원가입 아이디 중복검사
 */
var check = false;


function formSubmit() {
	var form = document.signupForm;

	if ('' == form.memberId.value || !check) {
		
		form.memberId.focus();
		form.memberId.style.color = "red"; 
		
		return false;

	} else if ('' == form.memberName.value) {
		
		form.memberName.focus();
		form.memberName.style.color = "red"; 
		return false;
	} else if ('' == form.memberEmail.value) {
			
				 form.memberEmail.focus();
				 form.memberEmail.style.color = "red";
		return false;
 
	} else if ('' == form.memberPassword.value) {
		
		 form.meberPassword.focus();
		 form.meberPassword.style.color = "red";
		return false;
	} else if ('' == form.memberRePassword.value) {
		
		form.memberRePassword.focus();
		form.memberRePassword.style.color = "red";
		return false;

	} else if ('' == form.meberNickname.value|| !check) {
		
		form.meberNickname.focus();
		form.meberNickname.style.color = "red";
		return false;

	} else if ('' == form.memberFavorite.value) {
		
		form.memberFavorite.focus();
		form.memberFavorite.style.color = "red";
		return false;
		
	
		
	} else if ('' == form. memberAge.value) {
		form. memberAge.focus();
		form. memberAge.style.color = "red";
		return false;
		
	} else if ('' == form. memberRegion.value) {
		form. memberRegion.focus();
		form. memberRegion.style.color = "red";
		return false;

	}else if(form.memberPassword.value!=form.memberRePassword.value){
		form.memberRePassword.focus();
		form.memberRePassword.style.borderColor="red";
		return false;
	
	}
	//form.submit();	
}	

	
function checkid(id) {
	idCheck = false;
	if (id == "") {
		$("#idCheckText").text("아이디를 작성해주세요.");
		
	} else {
		$.ajax({
			url : contextPath + "/member/MemberCheckIdOk.me?id=" + id,
			
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				if (data.trim() == 'ok') {
					$("#idCheckText").text("사용할 수 있는 아이디입니다.");
					idCheck = true;
				
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
/*인증번호 받기를 누를때 checkemail해주기*/
//function checkEmail(email){
//	check=false;
//	if(form.memberEmail.value.search('@') == -1){
//		$("#emailCheckText").text("email을 다시 써주세요");
//	}else{
//		$()
//	}
//}

function checknickname(nickname) {
	nicknameCheck = false;
	if (nickname == "") {
		
		$("#nicknameCheckText").text("nickname을 작성해주세요.");
	} else {
		$.ajax({
			url : contextPath + "/member/nicknameChecknicknameOk.me?nickname=" + nickname,
			
			type : 'get',
			dataType : 'text',
			success : function(data) {
				
				if (data.trim() == 'ok') {
					$("#nicknameCheckText").text("사용할 수 있는 아이디입니다.");
					nicknameCheck = true;
				
				} else {
					$("#nicknameCheckText").text("중복된 아이디입니다.");
					
				}
			},
			error : function() {
				console.log("오류");
			}
		})
	}
}
$("input[name='memberNickname']").focusout(function(event) {
	var nickname = $("input[name='memberNickname']").val();
	checknickname(nickname);
})


$( document ).ready( function() {
        $( '.check-all' ).click( function() {
          $( '.check' ).prop( 'checked', this.checked );
        } )
      } )
      
      
$( document ).ready( function() {
        $( '.check' ).click( function() {
          $( '.check-all' ).prop( 'checked', this.checked );
        } )
      } )
