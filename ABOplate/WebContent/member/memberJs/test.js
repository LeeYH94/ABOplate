/**
 * formSubmit() 회원가입 필수항목 검사 checkid(id) 회원가입 아이디 중복검사
 */
var check = false;


function formSubmit() {
   var form = document.joinForm;
   
if ('' == form.memberId.value) {
      
      form.memberId.focus();
      form.memberId.style.borderColor = "red"; 
      
      return false;

   } else if ('' == form.memberName.value) {
      
      form.memberName.focus();
      form.memberName.style.borderColor = "red"; 
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

   } else if(form.memberPassword.value!=form.memberRePassword.value){
      form.memberRePassword.focus();
      form.memberRePassword.style.borderColor="red";
      return false;
   } else if ('' == form.memberNickname.value) {
      
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

   }
//   form.submit();   
}   

   
function checkid(id) {
   
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

function checknickname(nickname) {
   
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

/*
 * 인증번호 받기 버튼을 누르면
 * ajax를 써서 sendEmailOkAction으로 보내줌(.me를 통해)
 * 그러면 action통해서 위에 ajax처럼 pw가 매개변수로 전달됨
 * 거기서 받은 값 변수에 저장, 버튼 이름 재전송으로 바꾸고 input태그랑 버튼 생성(보이게)
 * 
 * input태그에 적은 값 버튼을 통해 받으면 받은 변수를 비교
 * 같으면 input이랑 버튼 없애고 인증 표시 
 * 근데 인증 받고 다른 이메일 칠 수도 있으니까
 * 1. 이메일은 readonly를 주든 해서 못바꾸게 하기
 * 2. 이메일 바꾸면 다시 인증버튼 만들어주고 재 인증 받게 하기
 * 둘중에 선택해서 하시면 될듯
 */
/*인증번호 받기를 누를때 checkemail해주기*/
function sendEmail(){
	
		$.ajax({
			url: contextPath + "/member/MemberCheckEmail.me=?memberEmail"+memberEmail,
			type: 'get',
			dataType: 'text',
			success: function(pw){
				var verifyKey = pw;
				$("#resendEmail").show();
				$("#verifyNum").show();
				var checkkey = $("input[name='numberKey']").val();
				if(pw==checkkey){
					$("#resendEmail").hide();
					$("#verifyNum").hide();
					$("#emailCheckText").text("인증완료");
				}else{
					
				}
			},
			error: function(){
				console.log("오류");
			}
		})
	
}

function checkEmail(email){
	
   if(form.memberEmail.value.search('@') == -1){
      $("#emailCheckText").text("email을 다시 써주세요");
   }else{
      //$("#emailCheckText").text("email다시");
   }
}

  
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
  
